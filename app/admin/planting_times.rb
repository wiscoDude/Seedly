ActiveAdmin.register PlantingTime do
  index do
    column :growing_zone, sortable: 'planting_time.growing_zone.name'
    column :plant, sortable: 'planting_time.plant.name'
    
    default_actions
  end
  
end
