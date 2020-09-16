class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.new(blog_id: params[:blog_id])
    favorite.save
    @blog = Blog.find(params[:blog_id])
  end

  def destroy
    favorite = current_user.favorites.find_by(blog_id: params[:blog_id])
    favorite.destroy
    @blog = Blog.find(params[:blog_id])
  end
end
