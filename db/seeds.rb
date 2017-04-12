# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

50.times do
  Book.create(title: Faker::Book.title, author: Faker::Book.author, description: Faker::Hipster.sentence)
end

100.times do
  username =   Faker::Color.color_name + "_" + Faker::Hipster.word
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: username )
end


200.times do
  UserBook.create(user_id: Random.rand(100), book_id: Random.rand(50))
end
