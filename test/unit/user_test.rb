require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "create a user" do
    assert_difference('User.count') do
      user = User.new(:name => "Full Name", :email => "ex@hotmail.com", :password => "password", :password_confirmation => "password", :address_line => "123 Ape St", :city => "Houston", :state => "TX", :zipcode => 78705)
      assert user.save
	  assert_equal(user.email, "ex@hotmail.com")
    end
  end
  
  test "create a user with no name" do
    user = User.new(:name => '')
    assert !user.valid?
  end
  
  test "bad email" do
    user = User.new(:name => "Full Name", :email => "exhotmail.com", :password => "password", :password_confirmation => "password", :address_line => "123 Ape St", :city => "Houston", :state => "TX", :zipcode => 78705)
	assert !user.valid?
  end
  
  test "password is good" do
    assert_difference('User.count') do
      user = User.new(:name => "Full Name", :email => "ex@hotmail.com", :password => "password", :password_confirmation => "password", :address_line => "123 Ape St", :city => "Houston", :state => "TX", :zipcode => 78705)
      assert user.save
	  assert_equal(user.email, "ex@hotmail.com")
      assert_equal user.has_password?("password"), true
	end
  end

  test "bad name length" do
    user = User.new(:name => "AB", :email => "exhotmail.com", :password => "password", :password_confirmation => "password", :address_line => "123 Ape St", :city => "Houston", :state => "TX", :zipcode => 78705)
	assert !user.valid?
  end
  
  test "save fails with exception on violation" do
    user = User.new(:name => '123', :email => '123')
    
    assert_raise(ActiveRecord::RecordInvalid) { user.save! }
  end
  
  test "check for good authentication" do
    assert_difference('User.count') do
      user = User.new(:name => "Full Name", :email => "ex@hotmail.com", :password => "password", :password_confirmation => "password", :address_line => "123 Ape St", :city => "Houston", :state => "TX", :zipcode => 78705)
      assert user.save
	  assert_equal User.authenticate("ex@hotmail.com","password"), user
    end
  end
  
  test "check for failed authentication" do
    assert_difference('User.count') do
      user = User.new(:name => "Full Name", :email => "ex@hotmail.com", :password => "password", :password_confirmation => "password", :address_line => "123 Ape St", :city => "Houston", :state => "TX", :zipcode => 78705)
      assert user.save
	  assert_equal User.authenticate("ex@hotmail.com","bad_password"), nil
    end
  end
  
end
