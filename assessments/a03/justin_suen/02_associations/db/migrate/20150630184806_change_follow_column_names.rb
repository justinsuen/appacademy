class ChangeFollowColumnNames < ActiveRecord::Migration
  def change
    rename_column :follows, :followed_id, :player_id
    rename_column :follows, :follower_id, :fan_id
  end
end
