require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "user attributes must not be empty" do
		user = User.new
		assert user.invalid?
		assert user.errors[:username].any?
		assert user.errors[:name].any?
		assert user.errors[:lastname].any?
		assert user.errors[:email].any?
	end

	test "user is not valid without a unique title" do
		user = User.new(username: 	 "hola",
						name: 		 "yyy",
						lastname:	 "yy",
						email:	 	 "fred@hotmail.com")
		assert user.invalid?
		assert_equal [], user.errors[:username]
	end

end
