class PlantingTime < ActiveRecord::Base
  belongs_to :plant
  
  validates_presence_of :plant_id
  validates_presence_of :beginning_offset
  validates_presence_of :ending_offset
  validates_uniqueness_of :plant_id, :scope => [:season_type]
  validates_inclusion_of :season_type, :in => proc { SEASON_TYPES }
  
  SEASON_TYPES = ["transplant_outside_spring", "transplant_outside_fall", "spring_inside", "spring_outside", "fall_inside", "fall_outside"]

  def self.find_all_by_growing_zone_and_date(growing_zone, date)
    PlantingTime.find(:all, :conditions => \
    "(('#{growing_zone.last_frost.to_date}'::date + beginning_offset) \
     <= '#{date}'::date AND \
    ('#{growing_zone.last_frost.to_date}'::date + ending_offset) >= \
    '#{date}'::date) OR \
    (('#{growing_zone.first_frost.to_date}'::date + beginning_offset) \
     <= '#{date}'::date  AND \
    ('#{growing_zone.first_frost.to_date}'::date + ending_offset) >= \
    '#{date}'::date)")
  end
  
  def description_of_season
    case
    when self.season_type == "spring_inside"
      "Start Seed Indoors"
    when self.season_type == "spring_outside"
      "Plant Outside"
    end
  end
end
