class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :admin
  validates :email, :uniqueness => { :message => "emails should be unique per user!" }
  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :events, :through => :invitations
  has_many :invitations, :dependent => :destroy
  has_many :rankings
  has_many :suggestions
  
end
