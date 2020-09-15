class GenreBlog < ApplicationRecord
  belongs_to :genre, optional: true
  belongs_to :blog, optional: true
end
