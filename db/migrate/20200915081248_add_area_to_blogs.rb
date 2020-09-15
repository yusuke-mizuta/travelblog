class AddAreaToBlogs < ActiveRecord::Migration[5.2]
  def change
  	add_column :blogs, :area, :string
  end
end
