class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genres = Genre.page(params[:genre_page]).reverse_order
    @genre = Genre.find(params[:id])
    @blogs = @genre.genre_blogs.page(params[:blog_page]).reverse_order.limit(6)
  end
end
