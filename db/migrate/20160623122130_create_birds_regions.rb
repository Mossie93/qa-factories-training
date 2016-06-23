class CreateBirdsRegions < ActiveRecord::Migration
  def change
    create_table :birds_regions do |t|
      t.integer :bird_id
      t.integer :region_id
    end
  end
end
