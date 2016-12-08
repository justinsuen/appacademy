class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date
      t.string :color
      t.string :name
      t.string :sex, limit: 1
      t.string :description

      t.timestamps
    end

    add_index :cats, :name
    add_index :cats, :color
    add_index :cats, :sex
  end
end
