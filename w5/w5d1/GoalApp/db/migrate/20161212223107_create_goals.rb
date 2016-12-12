class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.string :details
      t.boolean :completed, default: false
      t.boolean :privacy, default: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :goals, :name, unique: true
  end
end
