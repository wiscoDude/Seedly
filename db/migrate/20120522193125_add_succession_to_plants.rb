class AddSuccessionToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :is_succession, :string
  end
end