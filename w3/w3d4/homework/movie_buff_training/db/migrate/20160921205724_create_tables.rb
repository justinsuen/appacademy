class CreateTables < ActiveRecord::Migration
  def change
  	
    create_table :actors do |t|
    	t.string :name, null: false
    end

    create_table :movies do |t|
    	t.string :title, null: false
    	t.integer :yr, null: false
    	t.float :score, null: false
    	t.integer :votes, null: false
    	t.integer :director_id, null: false
    end

    create_table :castings do |t|
    	t.integer :movie_id, null: false
    	t.integer :actor_id, null: false
    	t.integer :ord, null: false
    end

    add_index :actors, :name
    add_index :movies, :title
    add_index :movies, :director_id

  end
end
