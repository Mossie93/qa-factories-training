class AddNameToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :name, :string
  end
end
