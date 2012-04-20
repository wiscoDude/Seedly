class AddContainerCapableToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :type, :string
    add_column :plants, :container_capable, :boolean
  end
end
