class AddStarToBlogs < ActiveRecord::Migration[5.2]
  def change
  	add_column :blogs, :star, :float, default: 0.0
  end
end
