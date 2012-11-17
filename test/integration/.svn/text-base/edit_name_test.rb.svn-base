require 'test_helper'

class EditNameTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "edit an author name" do
    author1 = authors(:one)
    get "/authors/#{author1.id}/edit"    
    
    assert_response :success
    
    put_via_redirect "/authors/#{author1.id}", :author => { :id => authors(:one).id, :first_name => 'newname', :last_name => 'newlastname'}
    assert_response :success
    
    assert_equal 'Author was successfully updated.', flash[:notice]    
  end
  
  test "edit a book" do
    book1 = books(:one)
    get "/books/#{book1.id}/edit"    
    
    assert_response :success
    
    put_via_redirect "/books/#{book1.id}", :book => { :title => 'Boom boom', :price => 9.99, :inventory => 99, :publisher => 'Penguin', :image_url => '/images/Koala.jpg' }, :q => 'MyString', :r => 'MyString'
    assert_response :success
    
    assert_equal 'Book was successfully updated.', flash[:notice]    
  end
  
  test "edit a user name fails" do
    user1 = users(:one)
    get "/users/#{user1.id}/edit"    
    
    # assert_response :success
    
    put_via_redirect "/users/#{user1.id}", :user => { :id => users(:one).id, :name => 'newname', :email => 'nn@example.com'}
    assert_response :success
    
    assert_equal 'Please sign in to access this page.', flash[:notice]    
  end
  
end