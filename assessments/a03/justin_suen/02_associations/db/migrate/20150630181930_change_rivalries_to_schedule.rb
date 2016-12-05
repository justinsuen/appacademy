class ChangeRivalriesToSchedule < ActiveRecord::Migration
  def change
    drop_table :rivalries
    create_table :scheduled_games do |t|
      t.integer :home_team_id, null: false
      t.integer :away_team_id, null: false
      t.date :scheduled_date

      t.timestamps null: false
    end
  end
end
