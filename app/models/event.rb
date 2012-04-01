class Event < ActiveRecord::Base

  has_many :suggestions
  has_many :caves, :through => :suggestions

end
