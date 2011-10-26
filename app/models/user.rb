class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  acts_as_authentic do |c|
    c.login_field = :name
    c.merge_validates_length_of_login_field_options :within => 4..50
  end

  validates_uniqueness_of :email
  validates :name, :presence => true
end
