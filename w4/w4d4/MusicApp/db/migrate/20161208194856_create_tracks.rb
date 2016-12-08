class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :name, null: false
      t.string :track_type, null: false
      t.string :lyrics

      t.timestamps
    end

    add_index :tracks, :album_id
    add_index :tracks, :name
    add_index :tracks, :track_type
  end
end
