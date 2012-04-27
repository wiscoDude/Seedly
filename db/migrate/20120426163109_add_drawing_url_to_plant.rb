class AddDrawingUrlToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :drawing_image_url, :string
  end
end