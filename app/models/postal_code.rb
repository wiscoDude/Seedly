class PostalCode < ActiveRecord::Base
  validates_uniqueness_of :postal_code
  
end
  