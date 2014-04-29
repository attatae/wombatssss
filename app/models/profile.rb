class Profile < ActiveRecord::Base
	acts_as_taggable_on :interests, :skills
end
