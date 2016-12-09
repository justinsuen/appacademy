class AddActivationToUser < ActiveRecord::Migration
  def change
    add_column :users, :activation, :boolean, default: false
  end
end
