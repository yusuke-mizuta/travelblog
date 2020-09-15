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
end
