class CreateZipCodeTable < ActiveRecord::Migration
  def up
    create_table :postal_codes do |t|
      t.string :postal_code
      t.string :state
      t.string :city
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end

  def down
  end
end
