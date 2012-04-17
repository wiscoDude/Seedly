class ChangeZoneIdColumn < ActiveRecord::Migration
  def up
    rename_column :planting_times, :zone_id, :growing_zone_id
  end

  def down
  end
end
