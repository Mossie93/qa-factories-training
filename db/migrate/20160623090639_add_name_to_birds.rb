class AddNameToBirds < ActiveRecord::Migration
  def change
    add_column :birds, :name, :string
  end
end
