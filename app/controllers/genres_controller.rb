class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @blogs = @genre.genre_blogs.page(params[:page]).reverse_order.limit(6)
  end
end
