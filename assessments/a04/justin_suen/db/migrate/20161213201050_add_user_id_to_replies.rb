class AddUserIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :user_id, :integer
  end
end
