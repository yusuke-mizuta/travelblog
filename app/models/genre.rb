class Genre < ApplicationRecord
  has_many :genre_blogs
  has_many :blogs, through: :genres_blogs
end
