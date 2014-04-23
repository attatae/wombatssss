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
    time = event_start.in_time_zone.end_of_day
    time = time.change(hour: time_begin.hour, min: time_begin.min, sec: time_begin.sec) if show_time? && time_begin
    time
  end
end
