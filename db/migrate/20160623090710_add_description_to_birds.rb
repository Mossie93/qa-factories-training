class AddDescriptionToBirds < ActiveRecord::Migration
  def change
    add_column :birds, :description, :text
  end
end
