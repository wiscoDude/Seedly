class CreateGrowingZoneZipCodes < ActiveRecord::Migration
  def up
    create_table :growing_zone_zip_codes do |t|
      t.string :postal_code
      t.string :growing_zone_name
      
      t.timestamps
    end
  end

  def down
  end
end
