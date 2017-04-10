class Tweet < ActiveRecord::Base

  has_many :favorites
  has_many :users, through: :favorites

  validates :number, presence: true
  validates :number, uniqueness: true
  
end
