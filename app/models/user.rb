class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :interests
  #groups
  has_many :events #added after seeing in treehouse; 3/7 works fine localhost w/o
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :attendances, dependent: :destroy

  validates :email, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :profile_name, presence: true,
  #                         uniqueness: true,
  #                         format: {
  #                           with: /\A[a-zA-Z0-9_-]+\Z/,
  #                           message: 'Must be formatted correctly.'
  #                         }


  def full_name
  	first_name + " " + last_name
  end

  def attend(event, attend = true)
    attendances.find_or_initialize_by(event_id: event.id).update(attend: attend)
  end

  # Determine response to the event, 3 possible returned values:
  #   true  # => attending
  #   false # => not attending
  #   nil   # => no response yet to the event
  def attend_to?(event)
    attendances.find_by(event_id: event).try(:attend)
  end
end
