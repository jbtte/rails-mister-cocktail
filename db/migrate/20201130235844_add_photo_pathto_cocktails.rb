class AddPhotoPathtoCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :photo_path, :string
  end

end
