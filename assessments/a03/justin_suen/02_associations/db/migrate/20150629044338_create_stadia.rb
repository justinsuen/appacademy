class CreateStadia < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
      t.string :name, null: false
      t.integer :team_id, null: false

      t.timestamps null: false
    end
  end
end
