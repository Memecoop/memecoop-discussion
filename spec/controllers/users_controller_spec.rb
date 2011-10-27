require 'spec_helper'

describe UsersController do

  render_views

  describe "GET 'new'" do

    context "when not logged in" do

      it "is successful" do
        get 'new'
        response.should be_success
      end

      it "has the right title" do
        get 'new'
        response.should have_selector("title", :content => "Sign up")
      end
    end

  end

  describe "POST 'create'" do

    context "given invalid user data" do

      before(:each) do
        @attr = { :name => "", :email => "", :password => "",
                  :password_confirmation => "" }
      end

      it "does not create a user" do
        expect do
          post :create, :user => @attr
        end.to_not change(User, :count)
      end

      it "renders the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end

    context "given valid user data" do

      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com",
                  :password => "foobar", :password_confirmation => "foobar" }
      end

      it "creates a user" do
        expect do
          post :create, :user => @attr
        end.to change(User, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, :user => @attr
        response.should redirect_to(root_url)
      end

      it "displays a welcome flash message" do
        post :create, :user => @attr
        flash[:success].should =~ /Registration successful./i
      end

      it "signs in the just-created user"
    end
  end

  describe "GET 'edit'" do

    it "is successful"

    it "has the right title"

    it "has the current user's data pre-populated"
  end

  describe "PUT 'update'" do

    before(:each) do
      @user = Factory(:user)
      # login the user
    end

    context "given invalid user data" do

      before(:each) do
        @attr = { :email => "", :name => "", :password => "",
                  :password_confirmation => "" }
      end

      it "does not change the user's attributes"

      it "renders the 'edit' page"

      it "has the right title"
    end

    context "given valid user data" do

      before(:each) do
        @attr = { :name => "New Name", :email => "user@example.org",
                  :password => "barbaz", :password_confirmation => "barbaz" }
      end

      it "updates the user's attributes"

      it "redirects to the home page"

      it "displays a success flash message"

      it "has the right title"
    end
  end
end
