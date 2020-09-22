class AddLatitudeToBlogs < ActiveRecord::Migration[5.2]
  def change
  	add_column :blogs, :latitude, :string
  	add_column :blogs, :longitude, :string
  end
end
