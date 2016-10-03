class Guestlist < ApplicationRecord
	belongs_to :event, as: :attended_event, :foreign_key => 'event_id'
	belongs_to :user, as: :attendee_id, :foreign_key => 'attendee_id'
end
