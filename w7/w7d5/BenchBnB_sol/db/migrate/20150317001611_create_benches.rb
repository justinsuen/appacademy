class CreateBenches < ActiveRecord::Migration
  def change
    create_table :benches do |t|
      t.string :description
      t.string :lat
      t.string :long
      t.integer :seating
      t.string :material

      t.timestamps null: false
    end
  end
end
