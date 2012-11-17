require 'test_helper'

class CreateTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "create an author" do
    get "/authors/new"    
    
    assert_response :success
    
    post_via_redirect "/authors", :author => { :first_name => 'newname', :last_name => 'newlastname'}
    assert_response :success
    
    assert_equal 'Author was successfully created.', flash[:notice]    
  end
  
  test "create a book" do
    get "/books/new"    
    
    assert_response :success
    
    post_via_redirect "/books", :book => { :title => 'Boom boom', :publisher => 'Penguin', :price => 12.99, :inventory => 10, :image_url => "/images/Penguin.jpg" }, :q => 'MyString', :r => 'MyString'
    assert_response :success
    
    assert_equal 'Book was successfully created.', flash[:notice]    
  end
  
end