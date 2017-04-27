class TwitterUsersController < ApplicationController

  before_action :set_twitter_user

  private

  def set_twitter_user
    @twitter_user = TwitterUser.new(params[:id])
  end

end
