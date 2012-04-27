ActiveAdmin.register PlantingTime do
  index do
    column :plant, sortable: 'planting_time.plant.name'
    column :season_type
    column :beginning_offset
    column :ending_offset
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :plant
      f.input :season_type, :collection => PlantingTime.season_types
      f.input :beginning_offset
      f.input :ending_offset
      f.buttons
    end
  end
  
end
