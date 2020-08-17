require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/IMG_0166.jpeg')
    end
    
    it '入力項目が全て存在すれば出品できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

        it 'descriptionが空では出品できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'genre_idが1では出品できない' do
      @item.genre_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre must be other than 1")
    end

    it 'status_idが1では出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'bear_idが1では出品できない' do
      @item.bear_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Bear must be other than 1")
    end

    it 'area_idが1では出品できない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end

    it 'shipment_idが1では出品できない' do
      @item.shipment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment must be other than 1")
    end

    it 'ユーザーが紐づいていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

    it 'priceが空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300円未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが1000万円以上では出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end
