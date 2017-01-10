class AddPicturesToBenches < ActiveRecord::Migration
  def change
    add_column :benches, :picture_url, :string
  end
end
