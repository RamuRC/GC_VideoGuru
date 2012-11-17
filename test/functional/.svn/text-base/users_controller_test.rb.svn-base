require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end
  
  # test "should get index" do
    # get :index
    # assert_response :success
    # assert_not_nil assigns(:users)
  # end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get show" do
    get :show, :id => @user.to_param
    assert_response :success
  end
  
  # test "should create user" do
    # @user_new = User.new(:name => "MyString5", :email => "MyString@email.com", :password => "password", :password_confirmation => "password", :address_line => "123 New St", :city => "Houston", :state => "TX", :zipcode => 78705)
    # assert_difference('User.count') do
      # post :create, :User => @user_new.attributes
    # end

    # assert_redirected_to user_path(assigns(:user))
  # end
  
  # test "should get edit" do
    # get :edit, :id => @user.to_param
    # assert_response :success
  # end
  
  # test "should destroy user" do
    # assert_difference('User.count', -1) do
      # delete :destroy, :id => @user.to_param
    # end

    # assert_redirected_to users_path
  # end
  
end
