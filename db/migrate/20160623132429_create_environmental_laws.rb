class CreateEnvironmentalLaws < ActiveRecord::Migration
  def change
    create_table :environmental_laws do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
