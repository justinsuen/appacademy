class CreateRivalries < ActiveRecord::Migration
  def change
    create_table :rivalries do |t|
      t.integer :team_id_1, null: false
      t.integer :team_id_2, null: false

      t.timestamps null: false
    end
  end
end
