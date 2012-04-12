class CreateGrowingZonesTable < ActiveRecord::Migration
  def up
    create_table :growing_zones do |t|
      t.string :name
      t.string :description
      
      t.timestamps
    end
  end

  def down
  end
end
