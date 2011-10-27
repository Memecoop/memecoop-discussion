class PagesController < ApplicationController

  def help
    @title = "Help"
  end

  def home
    @title = "Home"
  end
end
