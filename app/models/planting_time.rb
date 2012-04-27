class PlantingTime < ActiveRecord::Base
  belongs_to :plant
  belongs_to :growing_zone
  
  validates_uniqueness_of :plant_id, :scope => [:growing_zone_id, :time_type]
  
  def self.find_all_by_growing_zone_and_date(growing_zone, date)
    sql = "growing_zone_id = #{growing_zone.id} \
    AND EXTRACT('month' from start_date) <= #{date.month} \
    AND EXTRACT('day' from start_date) <= #{date.day} \
    AND EXTRACT('month' from end_date) >= #{date.month} \
    AND EXTRACT('day' from end_date) <= #{date.day}"
    PlantingTime.find(:all, :conditions => sql, :include => :plant)
  end
  
  def type_of_planting
    case
    when self.time_type == "spring_inside"
      "Start Indoors"
    when self.time_type == "spring_outside"
      "Plant Outside"
    end
  end
end
