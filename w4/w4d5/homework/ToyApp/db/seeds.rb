# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  Corgi.create(name: Faker::Name.first_name)
  Cat.create(name: Faker::Name.first_name)
end

40.times do
  Toy.create(name: Faker::Superhero.name, toyable_id: rand(1..11), toyable_type: ["Corgi", "Cat"].sample)
end 
