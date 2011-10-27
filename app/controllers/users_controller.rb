class UsersController < ApplicationController
  # GET /users/new
  def new
    @title = "Sign up"
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Registration successful."
      redirect_to root_url
    else
      @title = "Sign up"
      render :action => 'new'
    end
  end

  # GET /users/1/edit
  def edit
    @title = "Edit User"
    @user = current_user
  end

  # PUT /users/1
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated profile."
      redirect_to root_url
    else
      @title = "Edit User"
      render :action => 'edit'
    end
  end

end
