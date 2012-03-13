class WeatherUnderground
  API_URL = "http://api.wunderground.com/api/"
  API_KEY = "acd53318fee79ebb"
  
  def self.get_weather_readings_for_day(date, postal_code)
    weather_reading = WeatherReading.new
    date_string = date.strftime("%Y%m%d")
    url = "#{API_URL}#{API_KEY}/history_#{date_string}/q/#{postal_code}.json"
    
    response = HTTParty.get(url)
    if response["history"].present?
      weather_reading.maxtemp = response["history"]["dailysummary"][0]["maxtempi"]
      weather_reading.mintemp = response["history"]["dailysummary"][0]["mintempi"]
      weather_reading.precipitation = response["history"]["dailysummary"][0]["precipi"]
      weather_reading.postal_code = postal_code
      weather_reading.recorded_at = date.to_date
      weather_reading
    end
  end
end