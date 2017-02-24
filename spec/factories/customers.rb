FactoryGirl.define do
  factory :customer do
    email {Faker::Internet.email}
    password "secret"
    verified_email true
  end
end
