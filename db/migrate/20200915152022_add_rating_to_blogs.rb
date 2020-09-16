class AddRatingToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :rating, :integer
  end
end
