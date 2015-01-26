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

# Create lists
15.times do
  List.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    cutoff: 7
  )
end
lists=List.all

#Create todos
100.times do
  Todo.create!(
    list: lists.sample,
    description: Faker::Lorem.sentence
  )
end
todos = Todo.all

#Create admin
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







