FactoryBot.define do
  factory :transaction_form do
    token_parameter = Faker::Internet.password
    token { "tok_#{token_parameter}" }
    postal_code { '123-4567' }
    area_id { 24 }
    city { '名古屋市' }
    block_number { '中区' }
    building { 'サカエビル' }
    phone_number { '09012345678' }
    item_id { 1 }
    user_id { 1 }
  end
end
