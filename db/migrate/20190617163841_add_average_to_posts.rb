class AddAverageToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column:posts,:average,:float
  end
end
