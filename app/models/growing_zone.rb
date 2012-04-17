class GrowingZone < ActiveRecord::Base
  validates_presence_of :name
  
  def self.find_by_zip(postal_code)
    growing_zone_zip_code = GrowingZoneZipCode.find_by_zip(postal_code)
    GrowingZone.find_by_name(growing_zone_zip_code.growing_zone_name) if growing_zone_zip_code.present?
  end
  
end
  