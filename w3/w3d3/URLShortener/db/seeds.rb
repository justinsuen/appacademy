# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  User.destroy_all
  user_1 = User.create(email: "dstern@nba.com")
  user_2 = User.create(email: "jamie@oliver.com")


  ShortenedUrl.destroy_all
  short_1 = ShortenedUrl.create(user_id: 1, short_url: "nba", long_url: "www.nba.com")
  short_2 = ShortenedUrl.create(user_id: 2, short_url: "fruits", long_url: "www.fruits4life.com")

  Visit.destroy_all
  visit_1 = Visit.create(user_id: 1, shortened_url: "nba")
  visit_2 = Visit.create(user_id: 1, shortened_url: "fruits")
  visit_3 = Visit.create(user_id: 2, shortened_url: "nba")
  visit_4 = Visit.create(user_id: 1, shortened_url: "nba")
  visit_5 = Visit.create(user_id: 2, shortened_url: "fruits")

  TagTopic.destroy_all
  tag_topic_1 = TagTopic.create(topic_name: "Basketball")
  tag_topic_2 = TagTopic.create(topic_name: "Fruits")

  Tagging.destroy_all
  tagging_1 = Tagging.create(tag_id: 1, link_id: 1)
  tagging_2 = Tagging.create(tag_id: 2, link_id: 2)
end
