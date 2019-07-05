class AddComentToComents < ActiveRecord::Migration[5.0]
  def change
    add_column:coments,:coment,:text
  end
end
