class BooksController < ApplicationController
  before_filter :run_before, :except => [:index, :show, :new, :edit, :destroy, :add_to_cart, :get_cart, :clear_cart, :view_cart]
  
  def run_before
    params[:book][:title] = params[:book][:title].humanize.titleize
	params[:book][:publisher] = params[:book][:publisher].humanize.titleize
  end
  
  def create_author(first, last)
    first = first.humanize.titleize
	last = last.humanize.titleize
    @author = Author.find_by_first_name_and_last_name(first, last)
    if @author == nil
	  name = {}
	  name["first_name"] = first
	  name["last_name"] = last
	  @author = Author.new(name) 
	  @author = nil unless @author.save
	end
  end
  
  # GET /books
  # GET /books.xml
  def index
    @books = Book.all
	# @book = Book.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])
	create_author(params[:q],params[:r])

	if @author != nil
      respond_to do |format|
        if @book.save
	      @author.books << @book unless @author.books.include? @book
		  @author = nil
          format.html { redirect_to(@book, :notice => 'Book was successfully created.') }
		  # format.js
          format.xml  { render :xml => @book, :status => :created, :location => @book }
        else
          format.html { render :action => "new" }
		  # format.js { render :action => 'create_error' }
          format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
        end
      end
	else
	  respond_to do |format|
	    format.html { render :action => "new" }
		# correc the line below
		format.xml { render :xml => {@author=>["Author name is not valid"]}, :status => :unprocessable_entity }
	  end
	end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])
	create_author(params[:q],params[:r])

    if @author != nil
	  respond_to do |format|
        if @book.update_attributes(params[:book])
	      @author.books << @book unless @author.books.include? @book
		  if params[:checks] != nil
	        params[:checks].each do |s|
		      if @book.authors.count > 1
	            @book.authors.delete(Author.find_by_id(s))
	          end
  	        end
	      end
		  @author = nil
          format.html { redirect_to(@book, :notice => 'Book was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
        end
	  end
	else
	  respond_to do |format|
	    flash.now[:error] = 'Author name not valid'
	    respond_to do |format|
	      format.html { render :action => "edit" }
	    end
	  end
	end
  end

  def destroy
    puts "***************"
	@book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end

  
  def add_to_cart
    @cart = get_cart
    @cart.add_to_cart(Book.find(params[:id]))
  end

  def get_cart
    if session[:cart]
      return session[:cart]
    else
      session[:cart] = Cart.new
      return session[:cart]
    end
  end
  
  def clear_cart
    @cart = get_cart
    @cart.clear
  end
  
  def view_cart
	@cart = get_cart
  end
  
end