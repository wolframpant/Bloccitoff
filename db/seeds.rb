require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users=User.all

15.times do
  List.create!(
    user: users.sample,
    title: Faker::Lorem.sentence
  )
end
lists=List.all

100.times do
  Todo.create!(
    list: lists.sample,
    description: Faker::Lorem.sentence
  )
end
todos = Todo.all

User.create!(
  name: 'Ellen Wolfson',
  email: 'llnwlfsn@gmail.com',
  confirmed_at: Time.now,
  password: 'helloworld'
)


puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Todo.count} todos created"







# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
