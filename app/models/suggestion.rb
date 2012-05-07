class Suggestion < ActiveRecord::Base

	belongs_to :cafe
	belongs_to :event

	has_one :user
	has_many :rankings

end
