class CreateWeatherTable < ActiveRecord::Migration
  def change
    create_table :weather_readings do |t|
      t.string :postal_code
      t.datetime :recorded_at
      t.decimal :maxtemp, :precision => 5, :scale => 2
      t.decimal :mintemp, :precision => 5, :scale => 2
      t.decimal :precipitation, :precision => 5, :scale => 2
 
      t.timestamps
    end
  end
end