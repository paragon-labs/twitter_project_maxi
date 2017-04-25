class TweetImage < ActiveRecord::Base

  belongs_to :tweet

  has_attached_file :image, default_url: ''
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
