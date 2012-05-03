class Plant < ActiveRecord::Base
  has_many :planting_times
  
  validates_presence_of :name
  validates_inclusion_of :sun_requirements, :in => proc { SUN_TYPES }
  
  SUN_TYPES = ["full", "partial"]
  
  def sun_requirements_icon
    case
    when self.sun_requirements.include?("full")
      "https://seedly.s3.amazonaws.com/full-sun.gif"
    when self.sun_requirements.include?("partial")
      "https://seedly.s3.amazonaws.com/partial-sun.gif"
    else
    end
  end
end
