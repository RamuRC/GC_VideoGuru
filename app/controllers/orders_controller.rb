class OrdersController < ApplicationController
attr_reader :mult_orders

  def init
    @mult_orders = []
  end

  def index
    @title = "All orders"
	@user = get_current_user
	@users = User.all
	# @orders = @user.orders.all
  end
  
  def checkout
    @user = get_current_user
    order_flag = true
	good_items_flag = true
	cart_flag = false
	new_id = 1
	@user.orders.each do |order|
	  # order_flag = false if order.status != 2
	  new_id = order.per_order_id + 1 if new_id <= order.per_order_id
	end
	@mult_orders = []
	cart = get_cart
	if order_flag == true
      cart.items.each do |book|
	    if book.inventory > 0
	      cart_flag = true
		  @order = Order.new
		  @mult_orders.each do |order|
		    @order = order if order.book_title == book.title
		  end
		  
		  if @order.book_title == nil
	        @order.status = 1
		    @order.per_order_id = new_id
		    @order.book_title = book.title
		    @order.price = book.price
			@order.quantity = 0
		  end
		  @order.incr_quantity
		  @mult_orders << @order unless @mult_orders.include? @order
		else
		  good_items_flag = false
		end
	  end
	  
	  if cart_flag == true
	    @mult_orders.each do |order|
	      order.status = 0
	      @user.orders << order
	    end
		flash.now[:notice] = "We are out of inventory for some items" if good_items_flag == false
		render :action => 'checkout'
	  else
	    flash[:notice] = "Cart is empty/We are out of inventory for one of these items"
	    redirect_to :controller => 'shop', :action => 'index'
	  end
	else
	  flash[:error] = "Previous order being processed; please try again."
	  done
	end
  end
  
  def done
    @user = get_current_user
	cart = get_cart
    @user.orders.each do |order|
	  if order.status != 2
		tmp_arr = []
	    cart.items.each do |book|
	      if book.title == order.book_title and !tmp_arr.include? book
		    book.decr_inventory(order.quantity)
			tmp_arr << book
		  end
	    end
	    order.ship_status
	  end
	end
	clear_cart
	redirect_to :controller => 'shop', :action => 'index'
  end
end
