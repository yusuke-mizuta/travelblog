class RemoveRatingToBlogs < ActiveRecord::Migration[5.2]
  def change
  	remove_column :blogs, :rating, :integer
  end
end
