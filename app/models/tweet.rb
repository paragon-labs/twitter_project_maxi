class Tweet < ActiveRecord::Base

  has_many :tweet_images
  has_many :favorites
  has_many :users, through: :favorites

  validates :number, presence: true
  validates :number, uniqueness: true

  accepts_nested_attributes_for :tweet_images

end
