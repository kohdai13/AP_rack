class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.string :address
      t.string :brand
      t.float :rate
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
