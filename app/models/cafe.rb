class Cafe < ActiveRecord::Base

    #
    attr_accessible :name, :address

    has_many :suggestions, :dependent => :destroy
  
    has_many :events, :through => :suggestions

    has_many :rankings, :through => :suggestions

    has_many :drinks

    validates :name, :presence => true

end
