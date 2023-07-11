# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Start seeding db'

puts 'Seeding users'

5.times do |i|
  user_data = {
    email: "test#{i + 1}@mail.com",
    name: Faker::Name.name
  }
  User.create(user_data)
end

puts 'Finished seeding users'

puts 'Seeding orders'

10.times do
  order_data = {
    amount: Faker::Number.number(digits: 5),
    user_id: User.find(User.pluck(:id).sample).id
  }
  Order.create(order_data)
end

3.times do
  order_data = {
    amount: Faker::Number.number(digits: 5),
    payment_status: 1,
    order_status: 3,
    payment_date: DateTime.now,
    delivery_date: DateTime.now,
    user_id: 1
  }
  Order.create(order_data)
end

puts 'Finished seeding orders'

puts 'Finished seeding db'
