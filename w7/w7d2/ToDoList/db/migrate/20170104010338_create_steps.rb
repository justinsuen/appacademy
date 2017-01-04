class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.string :title
      t.boolean :done
      t.integer :todo_id

      t.timestamps
    end
  end
end
