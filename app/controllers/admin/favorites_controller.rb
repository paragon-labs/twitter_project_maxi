module Admin
  class FavoritesController < ApplicationController

    before_action :authorize

    def index
      @favorites = Favorite.all.includes(:user, :tweet)
    end

    def new
      @favorite = Favorite.new
      @users = User.all
      @tweets = Tweet.all
    end

    def create
      @favorite = Favorite.new(favorite_params)
      if @favorite.save
        flash[:notice] = 'Favorite added successfully.'
        redirect_to admin_favorites_path
      else
        render 'new'
      end
    end

    private

    def favorite_params
      params.require(:favorite).permit(:user_id, :tweet_id)
    end

  end
end
