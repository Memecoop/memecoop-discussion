class UserSessionsController < ApplicationController
  def new
    @title = "Log in or sign up with Facebook"
    @user_session = UserSession.new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    if (auth_hash)
      authenticator = UserAuthenticator.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      if authenticator
        user = User.find(authenticator.user_id)
        @user_session = UserSession.new(user)
        if @user_session.save
          flash[:notice] = "Welcome back to Memecoop - you're now logged in!"
          redirect_to :back
        else
          flash[:notice] = "Could not log in - maybe you have cookies disabled?"
          redirect_to :back
        end
      else
        user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
        user.user_authenticators.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
        user.roles << "user"
        user.save

        @user_session = UserSession.new(user)
        if @user_session.save
          flash[:notice] = "Welcome to Memecoop - you're now logged in!"
          redirect_to :back
        else
          flash[:notice] = "Could not log in - maybe you have cookies disabled?"
          redirect_to :back
        end
      end
    else
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = "Successfully logged in."
        redirect_to :back
      else
       @title = "Sign in"
       flash.now[:error] = "Invalid username/password combination."
       redirect_to :back
      end
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end

  def failure
    flash[:notice] = "Sorry, but you didn't allow access to our app!"
    redirect_to :back
  end
end