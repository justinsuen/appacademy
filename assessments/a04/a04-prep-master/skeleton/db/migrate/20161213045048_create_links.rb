class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string :title
      t.string :url

      t.timestamps null: false
    end
    add_index :links, :user_id
    add_index :links, :title
  end
end
