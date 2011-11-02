class UserSessionsController < ApplicationController
  def new
    @title = "Sign in"
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_back_or root_path
    else
      @title = "Sign in"
      flash.now[:error] = "Invalid username/password combination."
      render :action => 'new'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end
end