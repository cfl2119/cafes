class Suggestion < ActiveRecord::Base

	belongs_to :cafe
	belongs_to :event

end
