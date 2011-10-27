require 'spec_helper'

describe "Users" do

  describe "signup task" do

    context "given invalid user data" do

      it "does not make a new user" do
        expect do
          visit signup_path
          fill_in "Name",                  :with => ""
          fill_in "Email",                 :with => ""
          fill_in "Password",              :with => ""
          fill_in "Password confirmation", :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.to_not change(User, :count)
      end
    end

    context "given valid user data" do

      it "makes a new user" do
        expect do
          visit signup_path
          fill_in "Name",                  :with => "Example User"
          fill_in "Email",                 :with => "user@example.com"
          fill_in "Password",              :with => "foobar"
          fill_in "Password confirmation", :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Registration successful.")
          response.should render_template('pages/home')
        end.to change(User, :count).by(1)
      end
    end
  end
end
