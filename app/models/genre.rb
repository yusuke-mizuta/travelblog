class Genre < ApplicationRecord
  has_many :genre_blogs, dependent: :destroy
  has_many :blogs, through: :genres_blogs
end
