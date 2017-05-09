module Admin
  class TweetsController < ApplicationController

    before_action :authorize

    def index
      @tweets = Tweet.all
    end

  end
end
