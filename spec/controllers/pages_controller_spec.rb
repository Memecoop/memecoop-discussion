require 'spec_helper'

describe PagesController do

  render_views

  describe "GET 'help'" do

    it "is successful" do
      get 'help'
      response.should be_success
    end

    it "has the right title" do
      get 'help'
      response.should have_selector("title", :content => "Help")
    end
  end

  describe "GET 'home'" do

    it "is successful" do
      get 'home'
      response.should be_success
    end

    it "has the right title" do
      get 'home'
      response.should have_selector("title", :content => "Home")
    end
  end
end
