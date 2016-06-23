class AddCountryIdToEnvironmentalLaws < ActiveRecord::Migration
  def change
    add_column :environmental_laws, :country_id, :integer
  end
end
