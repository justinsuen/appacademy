# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

john = Guest.create!({name: "John Smith", age: 45, favorite_color: "Blue"})
jane = Guest.create!({name: "Jane Doe", age: 47, favorite_color: "Green"})
josh = Guest.create!({name: "Josh Brown", age: 22, favorite_color: "Brown"})
helen = Guest.create!({name: "Helen White", age: 25, favorite_color: "White"})
job = Guest.create!({name: "Job Bluth", age: 41, favorite_color: "Red"})

Gift.create!({title: 'A Bottle of Wine', description: "This one is not so great.", guest_id: john.id})
Gift.create!({title: 'Another Bottle of Wine', description: 'This one is not so bad.', guest_id: john.id})
Gift.create!({title: 'The Hunger Games', description: "A bit dark for a gift, but it's good.", guest_id: jane.id})
Gift.create!({title: 'Baseball Glove', description: 'Feel like a kid again!', guest_id: josh.id})
Gift.create!({title: 'Basketball Tickets', description: "The team's going 82-0 this year.", guest_id: josh.id})
Gift.create!({title: 'Hawaiian Getaway', description: 'Helen has the best gifts.', guest_id: helen.id})

sse = Party.create!({name: "Secret Santa Extravaganza", location: "Portland"})
ccp = Party.create!({name: "Charles' Christmas Party", location: "San Francisco"})

Invitation.create!({guest_id: john.id, party_id: sse.id})
Invitation.create!({guest_id: jane.id, party_id: sse.id})
Invitation.create!({guest_id: josh.id, party_id: sse.id})
Invitation.create!({guest_id: helen.id, party_id: sse.id})
Invitation.create!({guest_id: job.id, party_id: sse.id})
Invitation.create!({guest_id: josh.id, party_id: ccp.id})
Invitation.create!({guest_id: helen.id, party_id: ccp.id})