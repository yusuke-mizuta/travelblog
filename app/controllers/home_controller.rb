class HomeController < ApplicationController
  def index
    @messages = Message.page(params[:page]).reverse_order.limit(5)
    @recent_blogs = Blog.page(params[:page]).reverse_order.limit(4)
    @genres = Genre.page(params[:page]).reverse_order.limit(8)
    @blog_ranks = Blog.find(Favorite.group(:blog_id).order('count(blog_id) desc').limit(3).pluck(:blog_id))
    # @star = Comment.where(blog_id: Blog.ids).average(:rate).round(1)
    @star_ranks = Blog.find(Comment.group(:blog_id).order('count(blog_id) desc').limit(3).pluck(:blog_id))
    #@avg = Comment.where(blog_id: Blog.ids).average(:rate).round(1)
    # @avg = Comment.where(Blog.group(:blog_id)).average(:rate).round(1)
    # @blogs = Blog.all
    # @blogs.each do |blog|
    # 	@avg = Comment.where(blog_id: blog.id).average(:rate)
    # end
  end
end
