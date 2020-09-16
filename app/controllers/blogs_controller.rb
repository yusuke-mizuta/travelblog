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
    genre_list = params[:blog][:name].split(nil)
    if blog.save
       blog.save_genre(genre_list)
       redirect_to blogs_path, notice: "ブログを投稿しました。"
    else
      render "new"
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
    blog.destroy
    redirect_to blogs_path(blog), notice: "ブログを削除しました。"
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :image, :user_id, :area, { genre_ids: [] })
  end
end
