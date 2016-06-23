class AddBirdIdToUserPhotos < ActiveRecord::Migration
  def change
    add_column :user_photos, :bird_id, :integer
  end
end
