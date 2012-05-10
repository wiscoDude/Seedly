class Plant < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id  
  validates_presence_of :postal_code
  validates_inclusion_of :garden_type, :in => proc { GARDEN_TYPES }
  
  GARDEN_TYPES = ["container", "regular"]
  
end
