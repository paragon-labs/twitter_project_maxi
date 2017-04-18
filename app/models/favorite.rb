class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :tweet

  validates_uniqueness_of :user_id, scope: :tweet_id
  validates_uniqueness_of :tweet_id, scope: :user_id

  after_destroy :check_tweet_status

  def check_tweet_status
    tweet = Tweet.find(tweet_id)
    if tweet.users.empty?
      tweet.destroy
    end
  end

end
