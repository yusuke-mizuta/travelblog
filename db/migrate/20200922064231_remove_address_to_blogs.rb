class RemoveAddressToBlogs < ActiveRecord::Migration[5.2]
  def change
  	remove_column :blogs, :address, :string
  end
end
