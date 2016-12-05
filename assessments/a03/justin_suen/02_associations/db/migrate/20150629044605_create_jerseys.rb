class CreateJerseys < ActiveRecord::Migration
  def change
    create_table :jerseys do |t|
      t.string :color
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
