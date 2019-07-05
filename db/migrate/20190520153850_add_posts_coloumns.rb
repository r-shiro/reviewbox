class AddPostsColoumns < ActiveRecord::Migration[5.0]
  def change
    add_column :posts,:genre,:string
    add_column :posts,:creator,:string
    add_column :posts,:company,:string
  end
end
