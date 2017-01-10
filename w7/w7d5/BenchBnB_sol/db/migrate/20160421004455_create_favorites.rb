class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.integer :user_id, null: false
    	t.integer :bench_id, null: false
      t.timestamps null: false
    end

    add_index :favorites, :user_id
    add_index :favorites, :bench_id
    add_index :favorites, [:user_id, :bench_id], unique: true
  end
end
