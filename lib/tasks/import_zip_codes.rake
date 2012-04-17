desc "Import Zip Data." 
task :import_zip_codes => :environment do
  File.open(File.join(Rails.root, "lib", "tasks", "zip_codes.txt"), "r")
  .each do |line|
    state_id, postal_code, state, city, longitude, latitude  = line.strip.split(",")
    postal_code = postal_code.gsub(/"/, "")
    state = state.gsub(/"/, "")
    city = city.gsub(/"/, "")
    
    postal_code = PostalCode.new(:postal_code => postal_code, :state => state, :city => city, :latitude => latitude, :longitude => longitude)
    postal_code.save
  end
end