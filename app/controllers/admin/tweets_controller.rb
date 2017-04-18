module Admin
  class TweetsController < ApplicationController

    before_action :authorize

    def index
      @tweets = Tweet.all
    end

    def new
      @tweet = Tweet.new
    end

    def create
      @tweet = Tweet.new(tweet_params)
      if @tweet.save
        flash[:notice] = 'Tweet created successfully.'
        redirect_to admin_tweets_path
      else
        render 'new'
      end
    end

    private

    def tweet_params
      params.require(:tweet).permit(:number, :text, :user_name, :user_screen_name,
                                    :user_url, :user_profile_img)
    end

  end
end
