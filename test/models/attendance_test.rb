require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  should belong_to(:event)
  should belong_to(:user)

  should validate_presence_of(:event_id)
  should validate_presence_of(:user_id)
  should allow_value(true, false).for(:attend)
  should_not allow_value(nil).for(:attend)
end
