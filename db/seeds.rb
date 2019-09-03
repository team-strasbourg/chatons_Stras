# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'pry'

Item.destroy_all
User.destroy_all
Cart.destroy_all
JoinTableCartItem.destroy_all

20.times do
	Item.create(title:Faker::Quote.robin, description:Faker::Quote.matz, price:Faker::Number.decimal(l_digits: 2), image_url:"item_cat.jpg")
end
puts "Items created"
5.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password, name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.most_interesting_man_in_the_world)
end
puts "Users created"

User.all.each do |user|
  Cart.create(user: user)
end
puts "Carts created"

Cart.all.each do |cart|
  rand(1..5).times do
		JoinTableCartItem.create(cart: cart, item: Item.all.sample)
  end
end
puts 'Carts filled with items'