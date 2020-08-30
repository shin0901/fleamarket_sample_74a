FactoryBot.define do

  factory :product do
    name          {"aaa"}
    description   {Faker::Lorem.sentence}
    price         {1000}
    user
    category
    condition
    brand
    days_until_shipping
    shipping_charge
    prefecture
    size
    images {[
     FactoryBot.build(:image, product: nil)
    ]}
  end

end