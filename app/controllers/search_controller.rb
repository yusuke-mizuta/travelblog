class SearchController < ApplicationController
  def search
    @blogs = Blog.none
    @users = User.none
    @genres = Genre.none
    if params[:search].present?
      if params[:model] == "user"
        @users = User.where("name LIKE ?", "%#{params[:search]}%")
      elsif params[:model] == "blog"
        @blogs = Blog.where("title LIKE ?", "%#{params[:search]}%")
      elsif params[:model] == "area"
        @blogs = Blog.where("area LIKE ?", "%#{params[:search]}%")
      elsif params[:model] == "genre"
        @genres = Genre.where("name LIKE ?", "%#{params[:search]}%")
      end
    else
      @blogs = Blog.none
      @users = User.none
      @genres = Genre.none
    end
  end
end
