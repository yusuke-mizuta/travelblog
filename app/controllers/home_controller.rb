class HomeController < ApplicationController
  def index
    @messages = Message.page(params[:page]).reverse_order.limit(5)
    @recent_blogs = Blog.page(params[:page]).reverse_order.limit(4)
    @genres = Genre.page(params[:page]).reverse_order
    # いいねの数ランキング
    @blog_ranks = Blog.find(Favorite.group(:blog_id).order('count(blog_id) desc').limit(3).pluck(:blog_id))
    # スターランキング
    @star_ranks = Blog.order('star desc').limit(3)
    # 人気タグランキング
    @genre_ranks = Genre.find(GenreBlog.group(:genre_id).order('count(genre_id) desc').limit(5).pluck(:genre_id))
  end
end
