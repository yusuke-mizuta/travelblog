class Blog < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :genre_blogs
  has_many :genres, through: :genre_blogs
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  validates :area, presence: true

  attr_accessor :genre_names

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_genre(sent_genres)
    current_genres = self.genres.pluck(:name) unless self.genres.nil?
    old_genre_names = current_genres - sent_genres
    new_genre_names = sent_genres - current_genres
    old_genre_names.each do |old|
      genre = Genre.find_by(name: old)
      GenreBlog.find_by(genre_id: genre.id).destroy
      #self.genre_blogs.delete GenreBlog.find_by(genre_id: genre.id)
    end
    new_genre_names.each do |n|
      genre = Genre.find_or_create_by(name: n)
      new_genre_blog = self.genre_blogs.create(genre_id: genre.id)
      #self.genre_blogs << new_genre_blog
    end
  end

end
