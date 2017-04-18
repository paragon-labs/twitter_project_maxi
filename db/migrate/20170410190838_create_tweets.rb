class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :number, null: false, limit: 8
      t.text :text
      t.string :user_name
      t.string :user_screen_name
      t.string :user_url
      t.string :user_profile_img

      t.timestamps null: false
    end

    add_index :tweets, :number, unique: true
  end
end
