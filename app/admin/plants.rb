ActiveAdmin.register Plant do
  index do
    column :name
    column :sun_requirements
    column :ease_of_maintenance
    column :plant_type
    column :container_capable
    
    default_actions
  end
end
