class ChangeOffsetsToIntegers < ActiveRecord::Migration
  def up
    add_column :planting_times, :beginning_offset, :integer
    add_column :planting_times, :ending_offset, :integer
    remove_column :planting_times, :begin_offset
    remove_column :planting_times, :end_offset
  end

  def down
  end
end