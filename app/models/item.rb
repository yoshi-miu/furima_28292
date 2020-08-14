class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :bear
  belongs_to_active_hash :area

  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :user
    with_options numericality: { other_than: 1 } do
      validates :genre_id
      validates :status_id
      validates :bear_id
      validates :area_id
    end
  end
end
