require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品の保存' do
    context '商品が保存できる場合' do
      it 'image, name, item_detail, category_id, item_status, shipping_fee, region, shipping_day, priceを保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が投稿できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが40文字以上では保存できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it 'item_detailが空では保存できない' do
        @item.item_detail = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end

      it 'item_detailが1000文字以上では保存できない' do
        @item.item_detail = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail is too long (maximum is 1000 characters)")
      end

      it 'category_idが未登録では保存できない' do
        @item.category_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'item_status_idが未登録では保存できない' do
        @item.item_status_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end

      it 'shiping_fee_idが未登録では保存できない' do
        @item.shipping_fee_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end

      it 'region_idが未登録では保存できない' do
        @item.region_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end

      it 'shipping_day_idが未登録では保存できない' do
        @item.shipping_day_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it 'priceが空では保存できない' do
        @item.price = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角文字では保存できない' do
        @item.price = '１０００'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが数字以外では保存できない' do
        @item.price = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
