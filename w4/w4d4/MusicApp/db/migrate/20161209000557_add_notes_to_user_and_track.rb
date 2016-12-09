class AddNotesToUserAndTrack < ActiveRecord::Migration
  def change
    add_column :users, :note_id, :integer
    add_column :tracks, :note_id, :integer
  end
end
