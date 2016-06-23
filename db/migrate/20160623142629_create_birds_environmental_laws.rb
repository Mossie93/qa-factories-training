class CreateBirdsEnvironmentalLaws < ActiveRecord::Migration
  def change
    create_table :birds_environmental_laws do |t|
      t.integer :bird_id
      t.integer :environmental_law_id
    end
  end
end
