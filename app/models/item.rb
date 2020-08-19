class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :bear
  belongs_to_active_hash :area
  belongs_to_active_hash :shipment

  with_options presence: true do
    validates :image
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9999999 }
    validates :description
    validates :user
    with_options numericality: { other_than: 1 } do
      validates :genre_id
      validates :status_id
      validates :bear_id
      validates :area_id
      validates :shipment_id
    end
  end
end
