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
          flash[:success] = "Welcome back to Memecoop - you're now logged in!"
          redirect_back
        else
          flash[:error] = "Could not log in - maybe you have cookies disabled?"
          redirect_back
        end
      else
        user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
        user.user_authenticators.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
        user.roles << "user"
        user.save

        @user_session = UserSession.new(user)
        if @user_session.save
          flash[:success] = "Welcome to Memecoop - you're now logged in!"
          redirect_back
        else
          flash[:error] = "Could not log in - maybe you have cookies disabled?"
          redirect_back
        end
      end
    else
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:success] = "Successfully logged in."
        redirect_back
      else
       @title = "Sign in"
       flash.now[:error] = "Invalid username/password combination."
       redirect_back
      end
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end

  def failure
    flash[:error] = "Sorry, but you didn't allow access to our app!"
    redirect_back
  end
end
