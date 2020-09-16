class Blog < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :genre_blogs
  has_many :genres, through: :genre_blogs
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_genre(sent_genres)
    current_genres = self.genres.pluck(:name) unless self.genres.nil?
    old_genres = current_genres - sent_genres
    new_genres = sent_genres - current_genres
    old_genres.each do |old|
      self.genre_blogs.delete GenreBlog.find_by(genre_blog_name: old)
    end
    new_genres.each do |new|
      new_genre_blog = GenreBlog.find_or_create_by(genre_blog_name: new)
      self.genre_blogs << new_genre_blog
    end
  end
end
