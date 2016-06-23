class AddAttachmentToUserPhotos < ActiveRecord::Migration
  def up
    add_attachment :user_photos, :attachment
  end

  def down
    remove_attachment :user_photos, :attachment
  end
end
