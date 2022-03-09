class AddGenreToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :genre, :string
  end
end
