class AddBenchToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :bench, index: true, foreign_key: true
  end
end
