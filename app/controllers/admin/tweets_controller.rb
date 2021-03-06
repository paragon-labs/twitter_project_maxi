module Admin
  class TweetsController < ApplicationController

    include SortColumns

    before_action :set_tweet, only: [:edit, :update, :destroy]
    before_action :authorize

    def index
      @tweets = Tweet.search(params[:search]).order(sort_order).paginate(page: params[:page], per_page: 10)
      respond_to do |format|
        format.js
        format.html
      end
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

    def update
      if @tweet.update(tweet_params)
        flash[:notice] = 'Tweet updated successfully.'
        redirect_to admin_tweets_path
      else
        render 'edit'
      end
    end

    def destroy
      @tweet.destroy
      flash[:notice] = 'Tweet deleted successfully.'
      redirect_to admin_tweets_path
    end

    private

    def tweet_params
      params.require(:tweet).permit(:number, :text, :user_name, :user_screen_name,
                                    :user_url, :user_profile_img, tweet_images_attributes: :image)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def sort_class
      Tweet
    end

  end
end
