class TransactionForm
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :area_id, :city, :block_number, :building, :phone_number, :item_id, :user_id

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  PHONENUMBER_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :block_number
    validates :phone_number, format: { with: PHONENUMBER_REGEX },
                             length: { maximum: 11 }
  end
  
  def save
    ShipAddress.create(postal_code: postal_code, area_id: area_id, city: city, block_number: block_number,
                       building: building, phone_number: phone_number, item_id: item_id)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end
