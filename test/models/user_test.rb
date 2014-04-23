require 'test_helper'

class UserTest < ActiveSupport::TestCase
	should have_many(:relationships)
	should have_many(:followed_users)
	should have_many(:attendances)

	test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user can have a correctly formatted profile name" do 
		user = User.new(first_name: 'chris', last_name: 'de Alba', email: 'cjdealba2@yahoo.net')
		user.password = user.password_confirmation = 'p4$$w0rd'

		user.profile_name = 'hippocampus661'
		assert user.valid?
	end

  # test "a user should have a profile name without spaces" do 
  #   user = User.new
  #   user.profile_name = "My Profile With Spaces"
  # 
  #   assert !user.save
  #   assert !user.errors[:profile_name].empty?
  #   assert user.errors[:profile_name].include?("Must be formatted correctly.")
  # end

  test "attend to an event" do
    assert users(:chris).attend(events(:two))
    assert users(:chris).attendances.where(event_id: events(:two).id, attend: true).exists?
  end

  test "not attend to an event" do
    assert users(:chris).attend(events(:two), false)
    assert users(:chris).attendances.where(event_id: events(:two).id, attend: false).exists?
  end

	#test "that no error is raised when trying to access a friend list" do 
	#	assert_nothing_raised do
	#		users(:chris).friends
	#	end
	#end
end

