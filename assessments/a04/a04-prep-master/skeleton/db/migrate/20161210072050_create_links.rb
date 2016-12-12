class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :links, :title
    add_index :links, :user_id
  end
end
