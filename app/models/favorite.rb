class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :tweet

  validates_uniqueness_of :user_id, scope: :tweet_id
  validates_uniqueness_of :tweet_id, scope: :user_id

  after_destroy :check_tweet_status

  def check_tweet_status
    if tweet.users.empty?
      tweet.delete
    end
  end

  def self.sortable_columns
    %w[user_id tweet_id users.email]
  end

  def self.default_column
    'user_id'
  end

  def self.search(search, column = 'tweet_id')
    if !search.blank? && ['user_id', 'tweet_id'].include?(column)
      where("#{column} = ?", search)
    else
      all
    end
  end

end
