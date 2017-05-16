class AddAttachmentImageToTweetImages < ActiveRecord::Migration
  def self.up
    change_table :tweet_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tweet_images, :image
  end
end
