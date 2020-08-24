require 'rails_helper'

RSpec.describe TransactionForm, type: :model do
  describe '#create' do
    before do
      @transaction = FactoryBot.build(:transaction_form)
    end

    it '全ての値が正しく入力されていれば保存できる' do
      expect(@transaction).to be_valid
    end

    it 'tokenが空では保存できない' do
      @transaction.token = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では保存できない' do
      @transaction.postal_code = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
      @transaction.postal_code = '1234567'
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include('Postal code is invalid')
    end

    it 'area_idが1では保存できない' do
      @transaction.area_id = 1
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include('Area must be other than 1')
    end

    it 'cityが空では保存できない' do
      @transaction.city = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("City can't be blank")
    end

    it 'block_numberが空では保存できない' do
      @transaction.block_number = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Block number can't be blank")
    end

    it 'phone_numberが空では保存できない' do
      @transaction.phone_number = nil
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが数字のみで入力されていないと保存できない' do
      @transaction.phone_number = '00-123-4567'
      @transaction.valid?
      expect(@transaction.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
