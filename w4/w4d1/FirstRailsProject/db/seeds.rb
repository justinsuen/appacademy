# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  user_1 = User.create(name: "Kobe Bryant", email: "kobe@bryant.com")
  user_2 = User.create(name: "Steph Curry", email: "steph@curry.com")
  user_3 = User.create(name: "Lebron James", email: "lebron@james.com")
end
