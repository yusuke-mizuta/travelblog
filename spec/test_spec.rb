require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  describe 'トップページ' do
    context "トップページが正しく表示される" do
      before do
        get blogs_path
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("旅ブログ")
      end
      it '人気の記事が正しく表示されていること' do
        expect(response.body).to include("人気の記事")
      end
    end
  end
end

RSpec.describe "Users", type: :request do
  describe 'マイページ' do
    context "マイページが正しく表示される" do
      before do
        get user_path(user.id)
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("マイページ")
      end
      it  'ユーザー情報が正しく表示されていること' do
        expect(response.body).to include("ユーザー情報")
      end
      it '自分の名前が表示される' do
        expect(page).to have_content user.name
      end
    end
  end
end

RSpec.describe "Users", type: :request do
	describe 'ユーザー認証のテスト' do
	  describe 'ユーザー新規登録' do
	    before do
	      get new_user_registration_path
	    end
	    context '新規登録画面に遷移' do
	      it '新規登録に成功する' do
	        fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
	        fill_in 'user[email]', with: Faker::Internet.email
	        fill_in 'user[password]', with: 'password'
	        fill_in 'user[password_confirmation]', with: 'password'
	        click_button 'Sign up'
	        expect(page).to have_content 'successfully'
	      end
	      it '新規登録に失敗する' do
	        fill_in 'user[name]', with: ''
	        fill_in 'user[email]', with: ''
	        fill_in 'user[password]', with: ''
	        fill_in 'user[password_confirmation]', with: ''
	        click_button 'Sign up'

	        expect(page).to have_content 'error'
	      end
	    end
	  end
	end
end