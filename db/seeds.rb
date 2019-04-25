# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# supprime toutes les entrées
City.destroy_all
Gossip.destroy_all
GossipTag.destroy_all
PmRecipient.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all
User.destroy_all
Comment.destroy_all

# créé 10 cities
10.times do
  City.create!(name: Faker::Address.unique.city, zip_code: Faker::Address.zip_code)
end

#Créé 5 users
10.times do
  User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, description: Faker::ChuckNorris.fact , email: Faker::Internet.email , age: rand(18..100) , city_id: City.all.sample.id)
end

# Créé 10 gossips
20.times do
  Gossip.create!(title: Faker::Friends.character, content: Faker::Friends.quote , user_id: User.all.sample.id )
end

# créé 10 tags
10.times do
  Tag.create!(title: Faker::Zelda.unique.location)
end

10.times do
  Comment.create!(content: Faker::ChuckNorris.fact, user_id: User.all.sample.id, commenteable_id:Gossip.all.sample.id, commenteable_type: "Gossip")
  Comment.create!(content: Faker::ChuckNorris.fact, user_id: User.all.sample.id, commenteable_id: Comment.all.sample.id, commenteable_type: "Comment")
end

10.times do
  Like.create!(user_id: User.all.sample.id, likeable_id:Gossip.all.sample.id, likeable_type: "Gossip")
  Like.create!(user_id: User.all.sample.id, likeable_id: Comment.all.sample.id, likeable_type: "Comment")
end

# créé 10 PM
10.times do
  PrivateMessage.create!(content: Faker::ChuckNorris.fact, sender_id: User.all.sample.id)
end

40.times do
  PmRecipient.create!(recipient_id: User.all.sample.id ,private_message_id: PrivateMessage.all.sample.id)
end

10.times do
  GossipTag.create!(gossip_id: Gossip.all.sample.id , tag_id: Tag.all.sample.id)
end

