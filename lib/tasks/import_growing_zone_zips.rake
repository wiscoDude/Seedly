desc "Import Growing Zone Zip Data." 
task :import_growing_zone_zips => :environment do
  File.open(File.join(Rails.root, "lib", "tasks", "zip_growing_zone_3digit.csv"), "r")
  .each do |line|
    postal_code, growing_zone  = line.strip.split(",")
    zip = GrowingZoneZipCode.new(:growing_zone_name => growing_zone, :postal_code => postal_code)
    zip.save
  end
end