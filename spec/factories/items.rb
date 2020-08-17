FactoryBot.define do
  factory :item do
    name { Faker::Lorem.words(number: 1) }
    price { Faker::Number.number(digits: 5) }
    description { Faker::Lorem.sentence }
    genre_id { 2 }
    status_id { 2 }
    bear_id { 2 }
    area_id { 2 }
    shipment_id { 2 }
    association :user
  end
end
