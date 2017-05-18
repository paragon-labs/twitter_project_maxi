module Admin
  class FavoritesController < ApplicationController

    before_action :authorize
    before_action :set_favorite, only: [:edit, :update, :destroy]

    def index
      @favorites = Favorite.all.includes(:user, :tweet).order(sort_order).paginate(page: params[:page], per_page: 10)
      respond_to do |format|
        format.js
        format.html
      end
    end

    def new
      @favorite = Favorite.new
      @users = User.all
      @tweets = Tweet.all
    end

    def edit
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

    def update
      if @favorite.update(favorite_params)
        flash[:notice] = 'Favorite updated successfully.'
        redirect_to admin_favorites_path
      else
        render 'edit'
      end
    end

    def destroy
      @favorite.destroy
      flash[:notice] = 'Favorite removed successfully.'
      redirect_to admin_favorites_path
    end

    private

    def favorite_params
      params.require(:favorite).permit(:user_id, :tweet_id)
    end

    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def sort_order
      sort_column = %w[user_id tweet_id users.email].include?(params[:sortColumn]) ? params[:sortColumn] : 'user_id'
      sort_direction = params[:sortDirection] || 'asc'
      sort_column + ' ' + sort_direction
    end

  end
end
