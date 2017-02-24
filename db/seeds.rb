# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Customer.delete_all
PostalAddress.delete_all
Dwelling.delete_all
Item.delete_all
Order.delete_all
Purchase.delete_all

times = 10;

times.times do
  customer = Customer.create(
    email: Faker::Internet.email,
    password: "secret",
    braintree_customer_id: nil,
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    verified_email: false
  )
  address = PostalAddress.create(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    subdivision: Faker::Address.state,
    postal_code: Faker::Address.zip_code,
    country_code: Faker::Address.country_code,
    time_zone: Faker::Address.time_zone
  )
  Dwelling.create(
    customer_id: customer.id,
    address_id:address.id
  )


  order = Order.create(customer_id:1)

  times.times do
    puts "creating"
    unique =[true,false].sample
    availability = ["in-stock", "back-order", "sold-out"].sample
    item = Item.create(
      name: Faker.name,
      price: Faker::Number.decimal(2,2),
      availability: availability,
      unique:unique
    )
    Purchase.create(
      item_id: item.id,
      order_id:order.id
    )
  end

  Order.create(
  customer_id: customer.id, purchases:Purchase.all)
end
