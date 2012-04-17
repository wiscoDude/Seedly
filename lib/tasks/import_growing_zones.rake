desc "Import Growing Zones." 
task :import_growing_zones => :environment do
  File.open(File.join(Rails.root, "lib", "tasks", "growing_zones.txt"), "r")
  .each do |line|
    growing_zone_name = line.strip
    growing_zone = GrowingZone.new(:name => growing_zone_name)
    growing_zone.save
  end
end