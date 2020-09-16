class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def admin_index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @blogs = @genre.genre_blogs.page(params[:page]).reverse_order.limit(6)
  end

  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to genres_path, notice: "新しいジャンルを作成しました。"
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to genres_path, notice: "ジャンルを編集しました"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
