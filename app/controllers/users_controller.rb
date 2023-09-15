class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def add_user
    @user = User.new
    @user.username = params.fetch("input_username")

    if @user.valid?
      @user.save
      redirect_to users_path
    end
  end
end
