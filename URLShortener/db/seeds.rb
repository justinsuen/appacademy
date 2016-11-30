# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  User.destroy_all
  user_1 = User.create(email: "user@user.user")
  user_2 = User.create(email: "2@2.2")


  ShortenedUrl.destroy_all
  short_1 = ShortenedUrl.create(user_id: 1, short_url: "short_url", long_url: "looooooooooong_url")
  short_2 = ShortenedUrl.create(user_id: 2, short_url: "short2", long_url: "long2")

  Visit.destroy_all
  visit_1 = Visit.create(user_id: 1, shortened_url: "short_url")
  visit_2 = Visit.create(user_id: 1, shortened_url: "short2")
  visit_3 = Visit.create(user_id: 2, shortened_url: "short_url")
  visit_4 = Visit.create(user_id: 1, shortened_url: "short_url")
end
