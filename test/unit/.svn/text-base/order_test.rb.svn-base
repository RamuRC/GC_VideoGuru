require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "create an order" do
    assert_difference('Order.count') do
      order = Order.new(:status => "2", :per_order_id => '3', :book_title => "Random book", :price => 4.99, :quantity => 1)
      assert order.save
    end
  end

  test "update quantity" do
    assert_difference('Order.count') do
      order = Order.new(:status => "2", :per_order_id => '3', :book_title => "Random book", :price => 4.99, :quantity => 1)
      assert order.save
	  order.incr_quantity
	  assert_equal order.quantity, 2
    end
  end

end
