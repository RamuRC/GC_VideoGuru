require 'test_helper'

class ShowTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "show an author" do
    author1 = authors(:one)
    get "/authors/#{author1.id}"    
    
    assert_response :success
  end
  
  test "show a book" do
    book1 = books(:one)
    get "/books/#{book1.id}"    
    
    assert_response :success
  end
  
  # test "author index test" do
    # get "/authors"
	# assert_response :success
  # end
  
  # test "book index test" do
    # get "/books"
	# assert_response :success
  # end
  
end