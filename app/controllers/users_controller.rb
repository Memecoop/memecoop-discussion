class UsersController < ApplicationController
  filter_resource_access

  # GET /users
  # GET /users.json
  def index
    @title = "All Users"
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

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
      redirect_to root_path
    else
      @title = "Edit User"
      render :action => 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :ok }
    end
  end
end
