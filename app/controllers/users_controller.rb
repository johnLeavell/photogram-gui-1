class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def add_user
    @user = User.new
    @user.username = params.fetch("input_username")

    if @user.valid?
      @user.save

      flash[:notice] = "User created successfully."

      redirect_to("/users/#{@user.username}")
    else
      flash[:notice] = "User failed to create successfully."

      redirect_to users_path
    end
  end

  def show
    username = params.fetch("username")
    @user = User.where({:username => username }).first
  end

  def update
      id = params.fetch("id")
      @user = User.where({ :id => id }).first
  
      @user.username = params.fetch("input_username")

  
      if @user.valid?
        @user.save

        redirect_to("/users/#{@user.username}")
      else
        redirect_to users_path
      end
    end

end
