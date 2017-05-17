class FavoritesController < ApplicationController

  def index
    @favorites = current_user.faved_tweets.includes(:tweet_images)
  end

  def create
    current_user.favorite!(tweet)
    @tweet_number = tweet.number
  end

  def destroy
    @tweet = Tweet.find_by!(number: params[:id])
    current_user.unfavorite!(@tweet)
  end

  private

  def faved_tweet_params
    params.require(:tweet).permit(:number, :text, :user_name, :user_screen_name,
                                  :user_url, :user_profile_img, tweet_images_attributes: :image)
  end

  def tweet
    Tweet.find_or_initialize_by(number: faved_tweet_params[:number]) do |t|
      t.attributes = faved_tweet_params
    end
  end

end
