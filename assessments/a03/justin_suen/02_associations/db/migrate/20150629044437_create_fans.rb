class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :name, null: false
      t.integer :favorite_team_id

      t.timestamps null: false
    end
  end
end
