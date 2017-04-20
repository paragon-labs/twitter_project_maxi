module Admin
  class FavoritesController < ApplicationController

    before_action :authorize

    def index
      @favorites = Favorite.all.includes(:user, :tweet)
    end

  end
end
