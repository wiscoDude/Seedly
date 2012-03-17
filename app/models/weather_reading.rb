class WeatherReading < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :maxtemp, :mintemp, :precipitation, :postal_code, :recorded_at
  validates_uniqueness_of :postal_code, :scope => :recorded_at
end
