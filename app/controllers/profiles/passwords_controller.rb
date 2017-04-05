module Profiles
  class PasswordsController < ApplicationController

    before_action :set_profile

    def update
      if @profile.update(password_params)
        flash[:notice] = 'Password changed successfully.'
        redirect_to home_index_path
      else
        render :edit
      end
    end

    private

    def set_profile
      @profile = current_user
    end

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

  end
end
