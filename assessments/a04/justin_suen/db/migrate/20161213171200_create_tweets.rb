class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :title
      t.string :body
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :tweets, :title
    add_index :tweets, :user_id
  end
end
