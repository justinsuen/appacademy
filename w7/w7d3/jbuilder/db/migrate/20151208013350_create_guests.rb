class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :age
      t.string :favorite_color

      t.timestamps null: false
    end
  end
end
