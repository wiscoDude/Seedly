class AddDaysHarvestingToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :days_germination, :integer
    add_column :plants, :days_to_harvest, :integer
    add_column :plants, :height, :integer
  end
end