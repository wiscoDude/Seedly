desc "Import Zip Data." 
task :import_other_zip_codes => :environment do
  File.open(File.join(Rails.root, "lib", "tasks", "zips_no_lat_long.txt"), "r")
  .each do |line|
    postal_code, city, state  = line.strip.split(",")
    postal_code = postal_code.gsub(/"/, "")
    state = state.gsub(/"/, "")
    city = city.gsub(/"/, "")
    
    postal_code = PostalCode.new(:postal_code => postal_code, :state => state, :city => city)
    postal_code.save
  end
end