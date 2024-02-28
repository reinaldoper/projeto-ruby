# test/models/user_test.rb

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one) 
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should require email" do
    @user.email = nil
    assert @user.valid?
  end

end
