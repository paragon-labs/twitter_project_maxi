module Admin
  module Users
    class PasswordsController < ApplicationController

      before_action :authorize

      def edit
        @user = User.find(params[:user_id])
      end

      def update
        @user = User.find(params[:user_id])
        if @user.update(password_params)
          flash[:notice] = "Password changed successfully."
          redirect_to admin_users_path
        else
          render :edit
        end
      end

      private

      def password_params
        params.require(:user).permit(:password, :password_confirmation)
      end

    end
  end
end
