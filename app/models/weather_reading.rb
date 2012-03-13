class WeatherReading < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :maxtemp, :mintemp, :precipitation, :postal_code, :recorded_at
end
