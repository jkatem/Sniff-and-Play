class AddImagesToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :images, :string
  end
end
