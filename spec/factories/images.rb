FactoryGirl.define do
  factory :image do
    association :imageable, factory: :item
    url {Faker::Avatar.image}
  end
end
