require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation、familyname_kanji、firstname_kanji、familyname_katakana、firstname_katakana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password_confirmation can't be blank")
      end
      it "familyname_kanjiが空では登録できない" do
        @user.familyname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname_kanji can't be blank")
      end
      it "firstname_kanjiが空では登録できない" do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname_kanji can't be blank")
      end
      it "familyname_katakanaが空では登録できない" do
        @user.familyname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname_katakana can't be blank")
      end
      it "firstname_katakanaが空では登録できない" do
        @user.firstname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname_katakana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("birthday can't be blank")
      end
    end
  end
end
