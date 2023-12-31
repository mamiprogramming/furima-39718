require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it 'imageとitem_name、explain、category_id、situation_id、postage_id、prefecture_id、amountday_id、price、user_idが存在すれば登録できる' do
        @item.user = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explainが空だと出品できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'category_idが1以外でないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を入力してください")
      end
      it 'situation_idが1以外でないと出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation を入力してください")
      end
      it 'postage_idが1以外でないと出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage を入力してください")
      end
      it 'prefecture_idが1以外でないと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を入力してください")
      end
      it 'amountday_idが1以外でないと出品できない' do
        @item.amountday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Amountday を入力してください")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を整数で入力してください")
      end
      it 'priceが300未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を整数で入力してください")
      end
      it 'priceが10000000以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を整数で入力してください")
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '９９９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を整数で入力してください")
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
