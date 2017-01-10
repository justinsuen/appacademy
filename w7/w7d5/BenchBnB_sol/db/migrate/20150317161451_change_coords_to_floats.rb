class ChangeCoordsToFloats < ActiveRecord::Migration
  def change
    remove_column :benches, :lat
    remove_column :benches, :long
    add_column :benches, :lat, :float
    add_column :benches, :long, :float
  end
end
