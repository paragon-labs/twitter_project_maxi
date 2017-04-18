class CreateTweetImages < ActiveRecord::Migration
  def change
    create_table :tweet_images do |t|
      t.string :url
      t.belongs_to :tweet, index: true

      t.timestamps null: false
    end
  end
end
