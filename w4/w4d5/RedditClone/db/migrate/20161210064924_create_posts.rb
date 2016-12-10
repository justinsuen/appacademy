class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :posts, :user_id
  end
end
