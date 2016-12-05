class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :fan_id, null: false
      t.integer :player_id, null: false

      t.timestamps null: false
    end
  end
end
