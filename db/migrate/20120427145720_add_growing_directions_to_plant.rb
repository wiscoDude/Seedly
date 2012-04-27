class AddGrowingDirectionsToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :growing_directions, :text
    change_column(:plants, :description, :text)
    change_column(:plants, :harvesting, :text)
  end
end