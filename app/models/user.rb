class User < ApplicationRecord
	has_many :events, as: :creator
	has_and_belongs_to_many :attended_events, as: :attendee, class_name: "Event"
end
