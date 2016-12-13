class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.integer :link_id

      t.timestamps null: false
    end
    add_index :comments, :user_id
    add_index :comments, :link_id
  end
end
