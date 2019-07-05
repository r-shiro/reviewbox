class AddSubnameToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column:posts,:subname,:string
  end
end
