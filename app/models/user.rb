class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.login_field = :name
  end


  validates_uniqueness_of :email, :facebook_uid
end
