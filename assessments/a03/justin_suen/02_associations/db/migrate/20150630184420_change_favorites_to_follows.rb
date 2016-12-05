class ChangeFavoritesToFollows < ActiveRecord::Migration
  def change
    drop_table :favorites
    create_table :follows do |t|
      t.integer :followed_id, null: false
      t.integer :follower_id, null: false

      t.timestamps null: false
    end
  end
end
