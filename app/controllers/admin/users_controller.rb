module Admin
  class UsersController < ApplicationController

    include SortColumns

    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :authorize

    def index
      @users = User.all.order(sort_order).paginate(page: params[:page], per_page: 10)
      respond_to do |format|
        format.js
        format.html
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'User successfully created.'
        redirect_to admin_users_path
      else
        render 'new'
      end
    end

    def update
      if @user.update(user_params)
        flash[:notice] = 'User updated successfully.'
        redirect_to admin_users_path
      else
        render 'edit'
      end
    end

    def destroy
      @user.destroy
      flash[:alert] = 'User deleted successfully.'
      redirect_to admin_users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :admin, :avatar)
    end

    def sort_class
      User
    end

  end
end
