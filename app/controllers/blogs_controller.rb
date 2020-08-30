class BlogsController < ApplicationController
  def index
  	@blogs = Blog.all
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

  private
  def blog_params
  	params.require(:blog).permit(:title, :body, :image, :user_id, :genre_id)
  end
end
