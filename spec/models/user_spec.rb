require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'last_nameが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'first_nameが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'last_name_furiganaが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'first_name_furiganaが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end



    context '新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'  
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
      end
      
      it '数字のみのパスワードでは登録できない・全角文字を含むパスワードでは登録できない' do
        @user.password = '123456'  
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
      end

      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '123cdf'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      

      it 'last_nameが空では登録できない' do
        @user.last_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'ｲﾅﾊﾞ'  
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end


      it 'first_nameが空では登録できない' do
        @user.first_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'ｴｲﾘ'  
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end

      it 'last_name_furiganaが空では登録できない' do
        @user.last_name_furigana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end

      it 'last_name_furiganaがカタカナ（全角）以外では登録できない' do
        @user.last_name_furigana = 'いなば'  
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana 全角カタカナを使用してください")
      end

      it 'first_name_furiganaが空では登録できない' do
        @user.first_name_furigana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end

      it 'first_name_furiganaがカタカナ（全角）以外では登録できない' do
        @user.first_name_furigana = 'えいり'  
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana 全角カタカナを使用してください")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
