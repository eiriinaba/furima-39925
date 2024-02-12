require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入処理' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '購入ができるとき' do
      it 'post_code,region_id,city,house_number,building,phone_numberが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
  
      it 'buildingが空でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
  
    context '購入ができない時' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeがハイフンを含まないと登録できない' do
        @order_address.post_code = '4480038'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'region_idが未登録では保存できない' do
        @order_address.region_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region can't be blank")
      end

      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'house_numberが全角文字では保存できない' do
        @order_address.house_number = '１０００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number is invalid. Should be in the format 123-4567 or 1234567")
      end

      it 'house_numberが数字以外では保存できない' do
        @order_address.house_number = 'abcdefg'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number is invalid. Should be in the format 123-4567 or 1234567")
      end

      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角文字では保存できない' do
        @order_address.phone_number = '１０００１００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Must be 10 or 11 digits")
      end
  
      it 'phone_numberが数字以外では保存できない' do
        @order_address.phone_number = 'abcdefghi'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Must be 10 or 11 digits")
      end

      it 'phone_numberが9桁以下では保存できない' do
        @order_address.phone_number = '080516094'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Must be 10 or 11 digits")
      end

      it 'phone_numberが12桁以上では保存できない' do
        @order_address.phone_number = '080516094567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Must be 10 or 11 digits")
      end

      it 'phone_numberがハイフンを含んでいると保存できない' do
        @order_address.phone_number = '080-5160-9456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Must be 10 or 11 digits")
      end
    end
  end
end