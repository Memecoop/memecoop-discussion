class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :roles

  acts_as_authentic do |c|
    c.login_field = :name
    c.merge_validates_length_of_login_field_options :within => 2..50
  end

  validates_uniqueness_of :email
  validates :name, :presence => true

  has_many :posts, :class_name => 'Node', :foreign_key => 'creator_id'

  # Code to support declarative_authorization package.

  # Roles are stored in a serialized field of the User model.
  serialize :roles, Array

  def role_symbols
    @role_symbols ||= (roles || []).map {|r| r.to_sym}
  end
end
