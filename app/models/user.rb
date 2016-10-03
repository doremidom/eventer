class User < ApplicationRecord
	has_many :events, as: :creator
end
