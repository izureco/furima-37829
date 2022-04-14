require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき -正常系-' do
      it '全ての情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき -異常系-' do
      it 'nicknameが空では登録できない' do
        @user.nickname=nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email=nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        email1 = @user.email
        user = FactoryBot.build(:user)
        user.email = email1
        user.valid?
        expect(user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email='aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字未満では登録できない' do
        @user.password = '1111a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '11111a'
        @user.password_confirmation = '11111b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含んでください")
      end
      it 'passwordが数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含んでください")
      end

      it '全角名前は苗字が存在しないと登録できない' do
        @user.lastname_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
      end
      it '全角名前は名前が存在しないと登録できない' do
        @user.firstname_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end
      it '全角名前は苗字が全角(漢字・かな・カナ）で入力されないと登録できない' do
        @user.lastname_kanji = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji 全角文字を使用してください")
      end
      it '全角名前は名前が全角(漢字・かな・カナ）で入力されないと登録できない' do
        @user.firstname_kanji = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji 全角文字を使用してください")
      end
      it 'カナ名前は苗字が存在しないと登録できない' do
        @user.lastname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'カナ名前は名前が存在しないと登録できない' do
        @user.firstname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'カナ名前は苗字が全角(カナ)で入力されないと登録できない' do
        @user.lastname_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana 全角カナを使用してください")
      end
      it 'カナ名前は名前が全角(カナ)で入力されないと登録できない' do
        @user.firstname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana 全角カナを使用してください")
      end
      it '生年月日が存在しないと登録できない' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
