require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  # test "should get index" do
    # get :index
    # assert_response :success
    # assert_not_nil assigns(:books)
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    @book_new = Book.new(:title => 'Random Book', :publisher => 'Penguin', :price => 9.99, :inventory => 10, :image_url => "/images/Koala.jpg")
    assert_difference('Book.count') do
      post :create, :book => @book_new.attributes, :q => "First", :r => "Last"
    end

    assert_redirected_to book_path(assigns(:book))
  end
  
  test "should create book and author" do
    @book_new = Book.new(:title => 'Random Book', :publisher => 'Penguin', :price => 9.99, :inventory => 10, :image_url => "/images/Koala.jpg")
    assert_difference('Book.count') do
      post :create, :book => @book_new.attributes, :q => "New", :r => "Author"
    end

    assert_redirected_to book_path(assigns(:book))
  end
  
  test "creating book: should fail while creating author" do
    @book_new = Book.new(:title => 'Random Book', :publisher => 'Penguin', :price => 9.99, :inventory => 10, :image_url => "/images/Koala.jpg")
    assert_difference('Book.count', 0) do
      post :create, :book => @book_new.attributes, :q => "123", :r => "Author"
    end
  end
  
  test "should not create book" do
    post :create, :book => @book.attributes, :q => "First", :r => "Last"
	assert_difference('Book.count', 0) do
      post :create, :book => @book.attributes, :q => "First", :r => "Last"
    end
  end
  
  test "should show book" do
    get :show, :id => @book.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @book.to_param
    assert_response :success
  end

  test "should update book" do
    put :update, :id => @book.to_param, :book => @book.attributes, :q => "First", :r => "Last"
    assert_redirected_to book_path(assigns(:book))
  end

  test "should fail to update book" do
    num = @book.authors.count
	put :update, :id => @book.to_param, :book => @book.attributes, :q => "123", :r => "Last"
    assert_equal @book.authors.count, num
  end
  
  test "should fail to update book again" do
    @book_bad2 = Book.new(:title => "MyString2", :publisher => "MyString", :price => 9.99, :inventory => 10, :image_url => "/images/Koala.jpg")
	put :update, :id => @book.to_param, :book => @book_bad2.attributes, :q => "First", :r => "Last"
    assert_equal @book.title, "MyString"
  end
  
  test "should not update book" do
    @book_bad = Book.new(:title => "MyString", :publisher => "MyString", :price => 9.99, :inventory => 10, :image_url => "/images/Koala.jpg")
    put :update, :id => books(:book1).to_param, :book => @book_bad.attributes, :q => "First", :r => "Last"
    assert_equal books(:book1).title, "In Human Bondage"
  end
  
  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, :id => @book.to_param
    end

    assert_redirected_to books_path
  end
end
