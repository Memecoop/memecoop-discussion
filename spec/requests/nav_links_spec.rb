require 'spec_helper'

describe "NavigationLinks" do

  it "has a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "has a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end

  it "has a Signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
end