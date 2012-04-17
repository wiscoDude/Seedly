class PlantingTime < ActiveRecord::Base
  belongs_to :plant
  belongs_to :growing_zone
  
  validates_uniqueness_of :plant_id, :scope => :growing_zone_id
end
