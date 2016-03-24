# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


andrew = User.create(username:"aykim", password:"test123")

User.create(username:Faker::Lorem.word, password:Faker::Number.number(6))
User.create(username:Faker::Lorem.word, password:Faker::Number.number(6))
User.create(username:Faker::Lorem.word, password:Faker::Number.number(6))
User.create(username:Faker::Lorem.word, password:Faker::Number.number(6))
User.create(username:Faker::Lorem.word, password:Faker::Number.number(6))
User.create(username:Faker::Lorem.word, password:Faker::Number.number(6))
User.create(username:Faker::Lorem.word, password:Faker::Number.number(6))
User.create(username:Faker::Lorem.word, password:Faker::Number.number(6))
User.create(username:Faker::Lorem.word, password:Faker::Number.number(6))

andrew.addresses << Address.create(street:Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr)
andrew.addresses << Address.create(street:Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr)
andrew.addresses << Address.create(street:Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr)


Category.create(name:"Books")
Category.create(name:"Electronics")
Category.create(name:"Clothing")
Category.create(name:"Accessories")


30.times do
Category.find(rand(1..4)).items.create(name: Faker::Lorem.word, price: Faker::Number.decimal(2), description:Faker::Lorem.sentences(10))
end



Item.all.each do |item|
  10.times do
    User.find(rand(1..8)).reviews << item.reviews.create(rating: rand(1..5), body:Faker::Lorem.sentences(rand(5..10)))
  end
end


10.times do
andrew.orders << Order.create(shopped_now: false)
end
andrew.orders << Order.create

andrew.orders.each do |order|
rand(3..5).times do
 order.items << Item.find(rand(1..20))
 end
end
