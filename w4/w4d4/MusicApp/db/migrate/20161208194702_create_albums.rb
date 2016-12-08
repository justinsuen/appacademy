class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :name, null: false
      t.string :album_type, null: false

      t.timestamps
    end

    add_index :albums, :name
    add_index :albums, :album_type
    add_index :albums, :band_id
  end
end
