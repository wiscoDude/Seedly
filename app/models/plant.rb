class Plant < ActiveRecord::Base
  has_many :planting_times
  
  validates_presence_of :name
  
  def self.sun_types
    ["Full Sun", "Full to Partial Sun"]
  end
  
  def sun_requirements_icon
    case
    when self.sun_requirements.include?("Full Sun")
      "https://seedly.s3.amazonaws.com/full-sun.gif"
    when self.sun_requirements.include?("Full to Partial Sun")
      "https://seedly.s3.amazonaws.com/partial-sun.gif"
    else
    end
  end
end
