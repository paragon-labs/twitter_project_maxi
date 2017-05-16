class RemoveUrlFromTweetImages < ActiveRecord::Migration
  def change
    remove_column :tweet_images, :url, :string
  end
end
