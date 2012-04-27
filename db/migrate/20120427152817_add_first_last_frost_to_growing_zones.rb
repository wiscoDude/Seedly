class AddFirstLastFrostToGrowingZones < ActiveRecord::Migration
  def change
    add_column :growing_zones, :first_frost, :datetime
    add_column :growing_zones, :last_frost, :datetime
  end
end