class RemovingGrowingZoneFromPlantingTimes < ActiveRecord::Migration
  def up
    add_column :planting_times, :season_type, :string
    add_column :planting_times, :begin_offset, :string
    add_column :planting_times, :end_offset, :string
    remove_column :planting_times, :growing_zone_id
    remove_column :planting_times, :end_date
    remove_column :planting_times, :start_date
    remove_column :planting_times, :time_type
  end

  def down
  end
end