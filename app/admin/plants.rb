ActiveAdmin.register Plant do
  index do
    column :image do |plant|
      image_tag(plant.drawing_image_url, :size => "30x30")
    end
    column :name
    column :sun_requirements
    column :difficulty
    column :plant_type
    column :container_capable
    
    default_actions
  end
  sidebar "times" do
    table_for plant.planting_times do |planting_time|
      column :season_type
      column :begin do |planting_time|
        planting_time.beginning_offset
      end
      column :end do |planting_time|
        planting_time.ending_offset
      end
    end
  end
  show do
    attributes_table *default_attribute_table_rows
    
    panel "Planting Times" do 
      table_for plant.planting_times do |planting_time|
        column :season_type
        column :beginning_offset
        column :ending_offset
      end
    end 
  end
end
