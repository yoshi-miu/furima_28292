FactoryBot.define do
  factory :item do
    name { 'ケーキバイキング' }
    price { 8000 }
    description { '有名ホテルのケーキが食べ放題' }
    genre_id { 11 }
    status_id { 2 }
    bear_id { 2 }
    area_id { 15 }
    shipment_id { 3 }
    association :user
  end
end
