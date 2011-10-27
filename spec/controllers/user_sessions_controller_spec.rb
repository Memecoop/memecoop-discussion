require 'spec_helper'

describe UserSessionsController do

  render_views

  describe "GET 'new'" do

    it "is successful" do
      get :new
      response.should be_success
    end

    it "has the right title" do
      get :new
      response.should have_selector("title", :content => "Sign in")
    end
  end

  describe "POST 'create'" do

    context "given invalid username/password" do

      before(:each) do
        @attr = { :email => "email@example.com", :password => "invalid" }
      end

      it "re-renders the new page" do
        post :create, :user_session => @attr
        response.should render_template('new')
      end

      it "has the right title" do
        post :create, :user_session => @attr
        response.should have_selector("title", :content => "Sign in")
      end

      it "displays a flash.now message" do
        post :create, :user_session => @attr
        flash.now[:error].should =~ /invalid/i
      end
    end

    context "given valid username/password" do

      it "signs the user in"

      it "redirects to the root page"
    end
  end

  describe "DELETE 'destroy'" do

    it "signs the user out"
  end
end