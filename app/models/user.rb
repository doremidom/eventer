class User < ApplicationRecord
	has_many :events, as: :creator
	has_and_belongs_to_many :attended_events, as: :attendee, class_name: "Event"

	def past_attended_events
		self.attended_events.where('date < ?', Time.now)
	end

	def past_hosted_events
		self.events.where('date < ?', Time.now)
		#self.past_hosted_events = self.events(LOGIC TO SELECT EVENTS WHERE DATE TIME IS BEFORE NOW)
	end

	def current_attended_events
		self.attended_events.where('date >= ?', Time.now)
		#self.current_attended_events = self.attended_events(LOGIC TO SELECT EVENTS WHERE DATE TIME IS AFTER NOW)
	end

	def current_hosted_events
		self.events.where('date >= ?', Time.now)
		#self.current_hosted_events = self.events(LOGIC TO SELECT EVENTS WHERE DATE TIME IS AFTER NOW)
	end



end
