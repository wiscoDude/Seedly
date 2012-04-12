class CreateGardens < ActiveRecord::Migration
  def up
    create_table :gardens do |t|
      t.integer :user_id
      t.integer :growing_zone_id
      t.string :postal_code
      t.string :garden_type
      
      t.timestamps
    end
  end

  def down
  end
end
