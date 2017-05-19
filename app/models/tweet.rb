class Tweet < ActiveRecord::Base

  has_many :favorites, dependent: :destroy
  has_many :tweet_images, dependent: :destroy
  has_many :users, through: :favorites

  validates :number, presence: true
  validates :number, uniqueness: true

  accepts_nested_attributes_for :tweet_images, reject_if: :all_blank, allow_destroy: true

  def self.sortable_columns
    column_names
  end

  def self.default_column
    'number'
  end

  def self.search(search, column = 'id')
    if !search.blank? && ['id', 'number'].include?(column)
      where("#{column} = ?", search)
    else
      all
    end
  end

end
