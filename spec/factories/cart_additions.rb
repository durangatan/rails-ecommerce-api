FactoryGirl.define do
  factory :cart_addition do
    customer
    item
    active true
    quantity [1..3].sample
  end
end
