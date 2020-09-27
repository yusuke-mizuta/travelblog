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
        expect(response.body).to include("人気のブログ")
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
          expect(page).to have_content '最近のブログ'
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
  describe 'ユーザー認証のテスト' do
    let!(:user) { create(:user) }

    describe 'ユーザーログイン' do
      before do
        visit new_user_session_path
      end

      context 'ログイン画面に遷移' do
        it 'ログインに成功する' do
          fill_in 'user[email]', with: "a@examle.com"
          fill_in 'user[password]', with: 'password'
          click_button 'ログイン'
          expect(page).to have_content 'ログインしました。'
        end
        it 'ログインに失敗する' do
          fill_in 'user[email]', with: 'a@text'
          fill_in 'user[password]', with: 'aaaaa'
          click_button 'ログイン'
          expect(page).to have_content 'ログイン'
        end
      end
    end
  end
end

RSpec.describe "Users", type: :system do
  describe 'ユーザー' do
    let!(:user) { create(:user) }

    context "ログインが正しく出来る" do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: "a@examle.com"
        fill_in 'user[password]', with: "password"
        click_button 'ログイン'
      end
      it 'トップページが正しく表示されていること' do
        expect(body).to include("新着のお知らせ")
        expect(body).to include("人気のブログ")
        expect(body).to include("最近のブログ")
        expect(body).to include("人気のタグ")
        expect(body).to include("評価の高いブログ")
      end
      it 'マイページが正しく表示されていること' do
        visit user_path(user.id)
        expect(body).to include("マイページ")
        expect(body).to include("ユーザー情報")
        expect(page).to have_content user.name
      end
      it 'ユーザー一覧が正しく表示されていること' do
        visit users_path
        expect(body).to include("自己紹介")
        expect(body).to include("ユーザー一覧")
        expect(page).to have_content user.name
      end
      it 'ブログ一覧が正しく表示されていること' do
        visit blogs_path
        expect(body).to include("ブログ一覧")
        expect(body).to include("場所")
        expect(body).to include("タイトル")
      end
      it 'ユーザー編集が正しく表示されていること' do
        visit edit_user_path(user.id)
        expect(body).to include("ユーザー情報")
        expect(body).to include("更新")
      end
      it 'ブログ投稿が正しく表示されていること' do
        visit new_blog_path
        expect(body).to include("ブログ投稿")
        expect(body).to include("新規投稿")
      end
      it 'ブログ投稿に成功する' do
        visit new_blog_path
        fill_in 'blog[title]', with: "test"
        fill_in 'blog[body]', with: 'text'
        fill_in 'blog[image]', with: "no_image.jpg"
        fill_in 'blog[area]', with: 'japan'
        click_button '新規投稿'
        expect(page).to have_content 'ブログを投稿しました。'
      end
      it 'ブログ投稿に失敗する' do
        visit new_blog_path
        fill_in 'blog[title]', with: ""
        fill_in 'blog[body]', with: ''
        fill_in 'blog[area]', with: ''
        click_button '新規投稿'
        expect(page).to have_content '新規投稿'
      end
    end
  end
end


