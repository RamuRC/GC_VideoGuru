require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "create a book" do
    assert_difference('Book.count') do
      book = Book.new(:title => "somebook", :publisher => "pub", :price => 4.99, :inventory => 5, :image_url => "/images/Lighthouse.jpg")
      assert book.save
    end
  end
  
  test "create a book and update inventory" do
    assert_difference('Book.count') do
      book = Book.new(:title => "somebook", :publisher => "pub", :price => 4.99, :inventory => 5, :image_url => "/images/Lighthouse.jpg")
      assert book.save
	  book.decr_inventory(2)
	  assert_equal book.inventory, 3
    end
  end
  
  test "create a book with bad price" do
    assert_difference('Book.count', 0) do
      book = Book.new(:title => "somebook", :publisher => "pub", :price => 0, :inventory => 5, :image_url => "/images/Lighthouse.jpg")
      assert !book.valid?
    end
  end
  
  test "create a book with missing info" do
    book = Book.new(:title => "somebook", :publisher => "", :price => 4.99, :inventory => 5, :image_url => "")
    assert !book.valid?
  end

  test "save fails with exception on violation" do
    book = Book.new(:title => "", :publisher => "pub", :price => 0, :inventory => 5, :image_url => "/images/Lighthouse.jpg")
    assert_raise(ActiveRecord::RecordInvalid) { book.save! }
  end
  
  test "create a book with bad info" do
    book = Book.new(:title => "somebook", :publisher => "pub", :price => "what", :inventory => 5, :image_url => "/images/Lighthouse.jpg")
    assert !book.valid?
  end
  
  test "create a book with non-unique title and publisher" do
    book = Book.new(:title => "In Human Bondage", :publisher => "Penguin", :price => 4.99, :inventory => 5, :image_url => "/images/Lighthouse.jpg")
    assert !book.valid?
  end
  
  test "create an image with wrong format" do
    book = Book.new(:title => "somebook", :publisher => "pub", :price => 4.99, :inventory => 5, :image_url => "/images/Lighthouse.abc")
    assert !book.valid?
  end
  
  test "search for book" do
    book_arr = []
    book_arr = Book.search("In Human Bondage")
    assert_equal book_arr[0].title, "In Human Bondage"
  end
  
  
end