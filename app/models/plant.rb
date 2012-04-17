class Plant < ActiveRecord::Base
  has_many :planting_times
  
  validates_presence_of :name
end
