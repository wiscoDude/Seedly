class CreatePlantingTimesTable < ActiveRecord::Migration
  def up
    create_table :planting_times do |t|
      t.integer :plant_id
      t.integer :zone_id
      t.string :earliest_spring_inside
      t.string :earliest_spring_outside
      t.string :latest_spring_inside
      t.string :latest_spring_outside
      t.string :earliest_fall_inside
      t.string :earliest_fall_outside
      t.string :latest_fall_inside
      t.string :latest_fall_outside
      
      t.timestamps
    end
  end

  def down
  end
end
