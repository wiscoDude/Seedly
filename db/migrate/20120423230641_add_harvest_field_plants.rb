class AddHarvestFieldPlants < ActiveRecord::Migration
  def up
    add_column :plants, :harvesting, :string
    rename_column :plants, :ease_of_maintenance, :difficulty
  end

  def down
  end
end
