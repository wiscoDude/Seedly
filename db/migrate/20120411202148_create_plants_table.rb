class CreatePlantsTable < ActiveRecord::Migration
  def up
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.string :image_url_young
      t.string :image_url_ready
      t.string :image_url_eating
      t.string :ease_of_maintenance
      t.string :space_requirements
      t.string :sun_requirements
      t.integer :quantity_per_square_foot
      t.string :seed_spacing
      t.string :planting_depth
      
      t.timestamps
    end
  end

  def down
  end
end
