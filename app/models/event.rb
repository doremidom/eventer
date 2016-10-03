class Event < ApplicationRecord
	belongs_to :user, :foreign_key => 'creator_id'
	has_and_belongs_to_many :attendees, as: 'attended_event', class_name: "User"
end
