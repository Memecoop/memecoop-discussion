require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name => "Example User",
              :email => "user@example.com",
              :password => "test_password",
              :password_confirmation => "test_password" }
  end

  describe "to validate input" do

    it "creates a new user given valid attributes" do
      User.create!(@attr)
    end

    it "requires a name" do
      no_name_user = User.new(@attr.merge(:name => ""))
      no_name_user.should_not be_valid
    end

    it "rejects names that are too long" do
      long_name = "a" * 51
      long_name_user = User.new(@attr.merge(:name => long_name))
      long_name_user.should_not be_valid
    end

    it "requires an email address" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end

    it "accepts valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end

    it "rejects invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end

    it "rejects duplicate email addresses" do
      # Put a user with given email address into the database.
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr.merge(:name => "Different User"))
      user_with_duplicate_email.should_not be_valid
    end

    it "rejects email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:name => "Different User", :email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end

    it "requires a password" do
      no_password_user = User.new(@attr.merge(:password => "", :password_confirmation => ""))
      no_password_user.should_not be_valid
    end

    it "requires password and confirmation to match" do
      mismatched_password_user = User.new(@attr.merge(:password => "wrong_password"))
      mismatched_password_user.should_not be_valid
    end
  end

  describe "to maintain database consistency" do

    it "allows creation of multiple users" do
      User.create!(@attr)
      User.create!(@attr.merge(:name => "Different User", :email => "different@example.com"))
    end
  end
end
