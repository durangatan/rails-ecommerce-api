FactoryGirl.define do
  factory :order do
    customer
    factory :order_with_purchases do
      after(:create) do |order|
        create(:purchase, order:order)
      end
    end
  end
end
