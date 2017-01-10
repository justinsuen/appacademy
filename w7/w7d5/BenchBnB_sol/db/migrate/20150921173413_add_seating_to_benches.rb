class AddSeatingToBenches < ActiveRecord::Migration
  def change
    add_column :benches, :seating, :integer, null: false, default: 2
  end
end
