class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.integer :track_id
      t.integer :user_id

      t.timestamps
    end

    add_index :notes, :track_id
    add_index :notes, :user_id
  end
end
