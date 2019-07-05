class AddRatingToComents < ActiveRecord::Migration[5.0]
  def change
    add_column:coments,:rating,:float
  end
end
