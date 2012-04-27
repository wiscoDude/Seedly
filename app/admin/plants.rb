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
        column :time_type
        column :start_date
        column :end_date
      end
    end 
  end
end
