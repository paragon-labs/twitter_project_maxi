class ProfilesController < ApplicationController

  before_action :set_profile

  def update
    if @profile.update(profile_params)
      flash[:notice] = 'Profile updated successfully.'
      redirect_to tweets_path
    else
      render 'edit'
    end
  end

  private

  def set_profile
    @profile = current_user
  end

  def profile_params
    params.require(:user).permit(:email)
  end

end
