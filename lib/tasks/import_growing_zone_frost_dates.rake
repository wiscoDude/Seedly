desc "Update growing zone frost dates." 
task :update_growing_zone_frost_dates => :environment do
  File.open(File.join(Rails.root, "lib", "tasks", "growing_zones.csv"), "r")
  .each do |line|
    growing_zone_name, first_frost, last_frost = line.strip.split(",")
    growing_zone = GrowingZone.find_by_name(growing_zone_name)
    growing_zone.first_frost = Date.parse(first_frost)
    growing_zone.last_frost = Date.parse(last_frost)
    growing_zone.save
  end
end