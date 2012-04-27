class FixTheNightmarishPlantingTimesTable < ActiveRecord::Migration
  def up
    add_column :planting_times, :start_date, :datetime
    add_column :planting_times, :end_date, :datetime
    add_column :planting_times, :time_type, :string
    remove_column :planting_times, :earliest_spring_inside
    remove_column :planting_times, :earliest_spring_outside
    remove_column :planting_times, :latest_spring_inside
    remove_column :planting_times, :latest_spring_outside
    remove_column :planting_times, :earliest_fall_inside
    remove_column :planting_times, :earliest_fall_outside
    remove_column :planting_times, :latest_fall_inside
    remove_column :planting_times, :latest_fall_outside
  end

  def down
  end
end