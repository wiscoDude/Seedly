desc "Import Germination Harvesting times." 
task :import_germination_harvesting => :environment do
  File.open(File.join(Rails.root, "lib", "tasks", "germination_harvest_times.csv"), "r")
  .each do |line|
    plant_name, germ_days, harvest_days = line.strip.split(",")
    plant = Plant.find_by_name(plant_name)
    if plant.present?
      plant.update_attribute(:days_germination, germ_days)
      plant.update_attribute(:days_to_harvest, harvest_days)
    end
  end
end