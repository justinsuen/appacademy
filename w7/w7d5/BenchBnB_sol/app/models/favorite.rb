class Favorite < ActiveRecord::Base
	validates :user_id, uniqueness: {scope: :bench_id}

	belongs_to :bench
	belongs_to :user
	
end
