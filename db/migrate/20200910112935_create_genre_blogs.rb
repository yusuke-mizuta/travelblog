class CreateGenreBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_blogs do |t|
      t.integer :blog_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
