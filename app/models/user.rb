class User < ActiveRecord::Base
  has_many :weather_reading, :foreign_key => "postal_code", :primary_key => "postal_code", :order => :recorded_at
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
      :postal_code, :first_name, :last_name, :city, :state, :latitude, :longitude
      
  def get_weather_for_user_for_date(date)
    reading = WeatherUnderground.get_weather_readings_for_day(date, self.postal_code)
    reading.save if reading.present?
  end
  
  def self.update_weather_readings_for_yesterday
    User.all.each do |user|
      user.get_weather_for_user_for_date(1.day.ago)
    end
  end
  
  def get_weather_for_last_month
    i = 1
    until i > 30
      self.delay.get_weather_for_user_for_date(i.days.ago)
      i+=1
    end
  end
  
  def name
    "#{self.first_name} #{self.last_name}".strip
  end
end
