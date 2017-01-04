class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :title
      t.string :description
      t.integer :guest_id

      t.timestamps null: false
    end
  end
end
