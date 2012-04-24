ActiveAdmin.register Plant do
  index do
    column :name
    column :sun_requirements
    column :difficulty
    column :plant_type
    column :container_capable
    
    default_actions
  end
  show do
    attributes_table *default_attribute_table_rows
    
    panel "Planting Times" do 
      table_for plant.planting_times do |planting_time|
        column :growing_zone, sortable: 'planting_time.growing_zone.name'
        column :earliest_spring_inside
        column :earliest_spring_outside
        column :latest_spring_inside
        column :latest_spring_outside
        column :earliest_fall_inside
        column :earliest_fall_outside
        column :latest_fall_inside
        column :latest_fall_outside
      end
    end 
  end
end
