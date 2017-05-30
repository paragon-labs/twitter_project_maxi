class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :faved_tweets, source: :tweet, through: :favorites

  has_attached_file :avatar, styles: { medium: '210x210>', thumb: '48x48>' } , default_url: ':style/default_avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def favorite!(tweet)
    faved_tweets << tweet
  end

  def unfavorite!(tweet)
    faved_tweets.destroy(tweet)
  end

  def faved?(tweet_number)
    faved_tweets.any? { |tweet| tweet.number == tweet_number }
  end

  def self.sortable_columns
    column_names
  end

  def self.default_column
    'email'
  end

  def self.search(search)
    if search
      where('email LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def search_faved_tweets(search)
    if search.present?
      faved_tweets.where('user_name ILIKE ?', "%#{search}%")
    else
      faved_tweets
    end
  end

end
