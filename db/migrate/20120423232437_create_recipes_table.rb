class CreateRecipesTable < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :plant_id
      t.string :name
      t.string :description
      t.string :url
      t.string :recipe_type
      
      t.timestamps
    end
  end

  def down
  end
end
