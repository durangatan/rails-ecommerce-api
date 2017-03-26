require 'faker'

Category.delete_all
Categorization.delete_all
Customer.delete_all
Dwelling.delete_all
Image.delete_all
Item.delete_all
Order.delete_all
PostalAddress.delete_all
Purchase.delete_all


categoryNew = Category.create(name:'New Instruments',thumbnail: 'seriesiisop.jpg');
categoryUsed = Category.create(name:'Used Instruments',thumbnail: 'markviten.png');

usedAltos = Category.create(name:'Used Alto Saxophones', parent_id:categoryUsed.id, thumbnail: 'cigas.jpg')
newAltos = Category.create(name:'New Alto Saxophones', parent_id:categoryNew.id, thumbnail: 'seriesiiias.jpg')
usedClarinets = Category.create(name:'Used Clarinets', parent_id:categoryUsed.id, thumbnail: 'buffet-r13-clarinet.png')
usedTenors = Category.create(name:'Used Tenor Saxophones', parent_id:categoryUsed.id,thumbnail:'markviten.png')
usedSopranos = Category.create(name:'Used Soprano Saxophones', parent_id:categoryUsed.id, thumbnail:'seriesiisop.jpg')
customer = Customer.create!(
  email: 'test@mail.com',
  password: 'secret',
  braintree_customer_id: nil,
  name: Faker::Name.name,
  phone: Faker::PhoneNumber.phone_number,
  verified_email: false
)
Customer.create!(
  email: 'admin@mail.com',
  password: 'secret',
  braintree_customer_id: nil,
  name: Faker::Name.name,
  phone: Faker::PhoneNumber.phone_number,
  verified_email: false,
  admin: true
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



itemArray =[{
              name:'Buffet R13 Clarinet',
              thumbnail:'buffet-r13-clarinet.png',
              category:usedClarinets,
              featured:true,
            price:240000},{
              name:'Selmer Cigar Cutter',
              thumbnail:'cigas.jpg',
              featured: false,
              category:usedAltos,
            price:500000},{
              name:'Selmer Mark VI Tenor Saxophone',
              thumbnail:'markviten.png',
              featured: true,
              category:usedTenors,
            price:1000000},{
              name:'Selmer Series III Alto Saxophone',
              thumbnail:'seriesiiias.jpg',
              featured: false,
              category:newAltos,
            price:500000},{
              name:'Selmer Series II Soprano Saxophone',
              thumbnail:'seriesiisop.jpg',
              featured: false,
              price:400000,
category:usedSopranos}]

itemArray.each do |item|

  unique =[true,false].sample
  availability = ['in-stock', 'back-order', 'sold-out'].sample
  new_item = Item.create(
    name: item[:name],
    price: item[:price],
    availability: availability,
    unique:unique,
    thumbnail: item[:thumbnail],
    featured: item[:featured]
  )
  category_id = item[:category].id
  Categorization.create(category_id:category_id,item_id:new_item.id)
end
