class GenreBlog < ApplicationRecord
  belongs_to :genre, optional: true
  belongs_to :blog, optional: true

  validates :genre_id, presence: true
  validates :blog_id, presence: true
end
