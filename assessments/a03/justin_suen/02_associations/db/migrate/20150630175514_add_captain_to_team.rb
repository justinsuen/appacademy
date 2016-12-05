class AddCaptainToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :captain_id, :integer
  end
end
