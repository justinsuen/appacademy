class CreateTagTopics < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :topic_name, null: false
      
      t.timestamps
    end
  end
end
