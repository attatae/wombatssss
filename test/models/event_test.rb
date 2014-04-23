require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should have_many(:attendances)
  should have_many(:guests)

  test "that an event requires content" do 
  	event = Event.new
  	assert !event.valid?
  	assert !event.errors[:text].empty?
  end

  test "that an event's text is at least 2 letters" do 
  	event = Event.new
  	event.text = "H"
  	assert !event.save
  	assert !event.errors[:text].empty?
  end

  test "event_time returns combination of date from event_start and time from time_begin" do
    event = Event.new(event_start: "2014-12-31", time_begin: "2000-01-01 01:02:03 UTC", show_time: true)
    assert_equal event.event_time, Time.utc(2014, 12, 31, 1, 2, 3)
  end

  #test "that an event has a user id" do 
  #	event = Event.new
  #	event.text = "Hello"
  #	assert !event.save
  #	assert !event.errors[:user_id].empty?
  #end
end
