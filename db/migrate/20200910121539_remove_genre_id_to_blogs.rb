class RemoveGenreIdToBlogs < ActiveRecord::Migration[5.2]
  def change
  	remove_column :blogs, :genre_id, :integer
  end
end
