class PlantingTime < ActiveRecord::Base
  belongs_to :plant
  
  validates_presence_of :plant_id
  validates_presence_of :beginning_offset
  validates_presence_of :ending_offset
  validates_uniqueness_of :plant_id, :scope => [:season_type]
  validate :season_type, :inclusion => { :in => proc { PlantingTime.season_types } }
  
  def self.season_types
    ["spring_inside", "spring_outside", "fall_inside", "fall_outside"]
  end
  
  def description_of_season
    case
    when self.season_type == "spring_inside"
      "Start Indoors"
    when self.season_type == "spring_outside"
      "Plant Outside"
    end
  end
end
