class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.integer :sub_id, null: false
      t.integer :author_id, null: false

      t.timestamps null: false
    end

    add_index :posts, :title
    add_index :posts, :url, unique: true
    add_index :posts, :author_id
    add_index :posts, :sub_id
  end
end
