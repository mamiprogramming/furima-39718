require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zipが空だと保存できないこと' do
        @order_address.zip = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip はハイフンを入力してください')
      end
      it 'zipが半角文字列の「3桁ハイフン4桁」の正しい形式でないと保存できないこと' do
        @order_address.zip = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid. Include hyphen(-)')
      end
      it 'prefecture_id が 1 の場合に無効であること' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture を選択してください')
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空だと保存できないこと' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneは9桁以下の場合登録できない' do
        @order_address.telephone = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone should be between 10 and 11 digits')
      end
      it 'telephoneは12桁以上の場合登録できない' do
        @order_address.telephone = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone should be between 10 and 11 digits')
      end
      it 'telephoneが数字以外では出品できない' do
        @order_address.telephone = 'abcdefghijk'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone should be only half-width numbers')
      end
      it 'telephoneが全角数字では出品できない' do
        @order_address.telephone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone should be only half-width numbers')
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていない場合登録できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていない場合登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
