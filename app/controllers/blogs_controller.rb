class BlogsController < ApplicationController
  def index
  end

  def new
  	@blog = Blog.new
  end

  def create
  	@blog =Blog.new(blog_params)
  	@blog.save
  	redirect_to blog_path(@blog), notice: "ブログを投稿しました。"
  end

  def show
  end

  def edit
  end

  private
  def blog_params
  	params.require(:blog)pemit(:title, :body, :image, :user_id, :genre_id)
end
