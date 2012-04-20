class RenamePlantTypeColumn < ActiveRecord::Migration
  def up
    rename_column :plants, :type, :plant_type
  end

  def down
  end
end
