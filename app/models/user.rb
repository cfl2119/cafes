class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  validates :email, :uniqueness => { :message => "emails should be unique per user!" }
  has_secure_password
  validates_presence_of :password, :on => :create
  
end
