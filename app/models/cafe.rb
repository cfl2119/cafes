class Cafe < ActiveRecord::Base
   
    #
    attr_accessible :name, :address

    has_many :suggestions
  
    has_many :events, :through => :suggestions

    has_many :drinks

end
