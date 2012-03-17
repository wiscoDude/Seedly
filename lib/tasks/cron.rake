task :cron => :environment do
  # heroku cron runs once per hour
  if Time.now.hour == 2
    User.update_weather_readings_for_yesterday
  end
  
end