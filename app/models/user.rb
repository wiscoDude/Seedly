class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
      :postal_code, :first_name, :last_name, :city, :state, :latitude, :longitude
      
  def get_weather_for_user_for_date(date)
    reading = WeatherUnderground.get_weather_readings_for_day(date, self.postal_code)
    reading.save
  end
  
  def self.update_weather_readings_for_yesterday
    User.all.each do |user|
      user.get_weather_for_user_for_date(1.day.ago)
    end
  end
end
