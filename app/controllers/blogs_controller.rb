class BlogsController < ApplicationController
  def index
  	@blogs = Blog.all
    @genres = Genre.all
    @blog_ranks = Blog.find(Favorite.group(:blog_id).order('count(blog_id) desc').limit(3).pluck(:blog_id))
  end

  def new
  	@blog = Blog.new
  end

  def create
  	@blog = Blog.new(blog_params)
  	@blog.user_id = current_user.id
  	@blog.save
  	redirect_to blogs_path, notice: "ブログを投稿しました。"
  end

  def show
  	@blog = Blog.find(params[:id])
  	@user = @blog.user
  	@comment = Comment.new
  end

  def edit
  	@blog = Blog.find(params[:id])
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
  	params.require(:blog).permit(:title, :body, :image, :user_id, :genre_id)
  end
end
