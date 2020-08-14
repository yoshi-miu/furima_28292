class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :user
    validates :genre_id, numericality: { other_than: 1 }
  end
end
