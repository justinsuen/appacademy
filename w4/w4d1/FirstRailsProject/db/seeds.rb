# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  user_1 = User.create(username: "kobebryant")
  user_2 = User.create(username: "stephcurry")
  user_3 = User.create(username: "lebronjames")

  Contact.destroy_all
  contact_1 = Contact.create(name: "Luke Walton", email: "luke@walton.com", user_id: 7)
end
