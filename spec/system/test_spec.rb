require 'rails_helper'

RSpec.describe "Root", type: :request do
  describe 'トップページ' do
    context "トップページが正しく表示される" do
      before do
        get root_path
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

RSpec.describe "Users", type: :system do
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_registration_path
      end
      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          fill_in 'user[name]', with: 'test'
          fill_in 'user[email]', with: 'a@example.com'
          fill_in 'user[password]', with: 'password'
          click_button '新規登録'
          expect(page).to have_content 'successfully'
        end
        it '新規登録に失敗する' do
          fill_in 'user[name]', with: ''
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          click_button '新規登録'
          expect(page).to have_content 'ログインしてください'
        end
      end
    end
  end
end

RSpec.describe "Users", type: :system do
  describe 'マイページ' do
    let!(:user) { create(:user) }
    context "マイページが正しく表示される" do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: "a@examle.com"
        fill_in 'user[password]', with: "password"
        click_button 'ログイン'
      end
      it 'マイページが正しく表示されていること' do
        visit user_path(user.id)
        expect(body).to include("マイページ")
        expect(body).to include("ユーザー情報")
        expect(page).to have_content user.name
      end
    end
  end
end

RSpec.describe "Users", type: :system do
  describe 'トップページ' do
    let!(:user) { create(:user) }
    context "トップページが正しく表示される" do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: "a@examle.com"
        fill_in 'user[password]', with: "password"
        click_button 'ログイン'
      end
      it 'お知らせが正しく表示されていること' do
        expect(body).to include("お知らせ")
      end
    end
  end
end

