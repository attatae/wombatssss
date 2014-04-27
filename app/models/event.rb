 class Event < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :attendances, dependent: :destroy
	has_many :guests, -> { where(attendances: { attend: true }) }, through: :attendances, source: :user
	belongs_to :user #added after seeing in treehouse version; works without on localhost 3/7

	validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true,
  								 length: { minimum: 2 }
 	validates :event_start, presence: true,
 										length: {minimum: 10}
  
  def event_time
    show_time? && time_begin? ? time_begin.change(year: event_start.year, month: event_start.month, day: event_start.day) : event_start.in_time_zone
  end

  def rsvp_active?
    (show_time? ? Time.now : Date.today) < event_time
  end
end
