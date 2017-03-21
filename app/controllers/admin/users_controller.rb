class Admin::UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]
  before_action :authorize

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
       render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end

  def authorize
    unless current_user.admin?
      redirect_to home_index_path
    end
  end

end
