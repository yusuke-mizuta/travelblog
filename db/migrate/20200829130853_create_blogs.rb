class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.string :image_id
      t.string :address
      t.integer :genre_id
      t.integer :user_id

      t.timestamps
    end
  end
end
