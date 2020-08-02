class RemoveStarFromPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :star, :integer
  end
end
