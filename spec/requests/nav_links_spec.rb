require 'spec_helper'

describe "NavigationLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "All Nodes")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
end