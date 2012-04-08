class User < ActiveRecord::Base

  validates :email, :uniqueness => { :message => "emails should be unique per user!" }

end
