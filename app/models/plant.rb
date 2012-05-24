class Plant < ActiveRecord::Base
  has_many :planting_times
  
  validates_presence_of :name
  validates_inclusion_of :sun_requirements, :in => proc { SUN_TYPES }
  
  SEEDLING_AGE_IN_DAYS = 21
  
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
  
  def difficulty_icon
    case
    when self.difficulty.include?("easy")
      "https://seedly.s3.amazonaws.com/simple.png"
    when self.difficulty.include?("hard")
      "https://seedly.s3.amazonaws.com/complex.png"
    else
    end
  end
  
  def time_for_seedlings
    self.days_to_harvest - self.days_germination - SEEDLING_AGE_IN_DAYS
  end
  
end
