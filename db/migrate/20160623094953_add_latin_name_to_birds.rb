class AddLatinNameToBirds < ActiveRecord::Migration
  def change
    add_column :birds, :latin_name, :string
  end
end
