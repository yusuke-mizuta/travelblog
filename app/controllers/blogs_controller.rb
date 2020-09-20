class BlogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @blogs = Blog.page(params[:page]).reverse_order
    @user = current_user
  end

  def new
    @blog = Blog.new
    @genres = Genre.all
  end

  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    #タグの複数登録
    genre_list = params[:blog][:genre_names].split(/　| /)
    if blog.save
      blog.save_genre(genre_list)
      redirect_to blog_path(blog), notice: "ブログを投稿しました。"
    else
      @blog = Blog.new
      @genres = Genre.all
      render "new"
      flash.now[:alert] = '必要事項を入力してください。'
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @user = @blog.user
    @comment = Comment.new
    if @blog.comments.present?
      @avg = Comment.where(blog_id: params[:id]).average(:rate).round(1)
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    @genres = Genre.all
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog), notice: "更新しました。"
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.destroy
      #0のタグを削除
       blog.delete_genre
       redirect_to blogs_path(blog), notice: "ブログを削除しました。"
    else
      render "show"
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :image, :user_id, :area)
  end
end
