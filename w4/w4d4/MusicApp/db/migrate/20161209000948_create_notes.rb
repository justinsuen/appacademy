class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :note
      t.integer :track_id
      t.integer :user_id

      t.timestamps
    end

    add_index :notes, :track_id, unique: true
    add_index :notes, :user_id, unique: true
  end
end
