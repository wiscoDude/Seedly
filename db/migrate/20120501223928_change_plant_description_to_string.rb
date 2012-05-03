class ChangePlantDescriptionToString < ActiveRecord::Migration
  def up
    change_column :plants, :description, :string
  end

  def down
  end
end