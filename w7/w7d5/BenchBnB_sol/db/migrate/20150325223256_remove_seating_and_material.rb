class RemoveSeatingAndMaterial < ActiveRecord::Migration
  def change
    remove_column :benches, :material
    remove_column :benches, :seating
  end
end
