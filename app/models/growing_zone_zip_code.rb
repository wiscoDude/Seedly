class GrowingZoneZipCode < ActiveRecord::Base
  validates_uniqueness_of :postal_code
  belongs_to :growing_zone, :foreign_key => "name"
  
  def self.find_by_zip(postal_code)
    # For now, we only have 3 digit matching
    GrowingZoneZipCode.find(:first, :conditions => ["substring(postal_code, 1, 3) = ?", postal_code[0..2]])
  end
end
  