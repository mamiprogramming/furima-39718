require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'abcd1234'
        @user.password_confirmation = 'abcd1234'
        expect(@user).to be_valid
      end
      it 'familyname_kanjiとfirstname_kanjiが全角（漢字・ひらがな・カタカナ）だと登録できる' do
        @user.familyname_kanji = '山田'
        @user.firstname_kanji = '太郎'
        expect(@user).to be_valid
      end
      it 'familyname_katakanaとfirstname_katakanaが全角（カタカナ）だと登録できる' do
        @user.familyname_katakana = 'ヤマダ'
        @user.firstname_katakana = 'タロウ'
        expect(@user).to be_valid
      end
      it 'nameとemail、passwordとpassword_confirmation、familyname_kanji、firstname_kanji、familyname_katakana、firstname_katakana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '1111111'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'password_confirmationがpasswordと合わなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'familyname_kanjiが空では登録できない' do
        @user.familyname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname kanji can't be blank"
      end
      it 'firstname_kanjiが空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kanji can't be blank"
      end
      it 'familyname_katakanaが空では登録できない' do
        @user.familyname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname katakana can't be blank"
      end
      it 'firstname_katakanaが空では登録できない' do
        @user.firstname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname katakana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
