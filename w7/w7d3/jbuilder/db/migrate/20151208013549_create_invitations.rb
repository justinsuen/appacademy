class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :guest_id
      t.integer :party_id

      t.timestamps null: false
    end
  end
end
