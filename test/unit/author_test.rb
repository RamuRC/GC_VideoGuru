require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "create an author" do
    assert_difference('Author.count') do
      author = Author.new(:first_name => 'Test', :last_name => 'Name')
      assert author.save
    end
  end
  
  test "create an author with missing info" do
    author = Author.new(:first_name => '', :last_name => 'Last')
    assert !author.valid?
  end
  
  test "create an author with bad info" do
    author = Author.new(:first_name => '123', :last_name => 'Last')
    assert !author.valid?
  end

  test "save fails with exception on violation" do
    author = Author.new(:first_name => 'first', :last_name => '123')
    assert_raise(ActiveRecord::RecordInvalid) { author.save! }
  end
  
  test "create an author with non-unique name" do
    author = Author.new(:first_name => 'MyString', :last_name => 'MyString')
    assert !author.valid?
  end
  
  test "create an author with short name" do
    author = Author.new(:first_name => 'A', :last_name => 'Last')
    assert !author.valid?
  end
  
  test "search for author" do
    author_arr = []
    author_arr = Author.search("MyString MyString")
    assert_equal author_arr[0].first_name, "MyString"
  end
end
