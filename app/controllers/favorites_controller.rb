class FavoritesController < ApplicationController

  def index
    @favorites = current_user.faved_tweets.includes(:tweet_images)
  end

  def create
    if current_user.favorite!(tweet)
      flash[:notice] = 'Tweet added to favorites.'
    else
      flash[:alert] = 'An error has occurred adding the favorite.'
    end
    redirect_to tweets_path
  end

  def destroy
    tweet = Tweet.find_by!(number: params[:id])
    current_user.unfavorite!(tweet)
    flash[:notice] = 'Tweet removed from favorites.'
    redirect_to :back
  end

  private

  def faved_tweet_params
    params.require(:tweet).permit(:number, :text, :user_name, :user_screen_name,
                                  :user_url, :user_profile_img, tweet_images_attributes: :url)
  end

  def tweet
    Tweet.find_or_initialize_by(number: faved_tweet_params[:number]) do |t|
      t.attributes = faved_tweet_params
    end
  end

end
