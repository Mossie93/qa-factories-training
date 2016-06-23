class AddUserIdToUserPhotos < ActiveRecord::Migration
  def change
    add_column :user_photos, :user_id, :integer
  end
end
