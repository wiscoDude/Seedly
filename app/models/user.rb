class User < ActiveRecord::Base
  has_many :weather_reading, :foreign_key => "postal_code", :primary_key => "postal_code"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
      :postal_code, :first_name, :last_name, :city, :state, :latitude, :longitude
  
  after_create :send_welcome_email
  before_save :update_city
  
  def get_growing_zone
    record = GrowingZoneZipCode.find_by_zip(self.postal_code)
    record.growing_zone_name if record.present?
  end
  
  def get_weather_for_user_for_date(date)
    existing = WeatherReading.find_by_postal_code_and_recorded_at(self.postal_code, date.to_date)
    if existing.blank?
      reading = WeatherUnderground.get_weather_readings_for_day(date, self.postal_code)
    end
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
  
  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
  
  def update_city
    if self.city.blank?
      zip = PostalCode.find_by_postal_code(self.postal_code)
      self.update_attribute(:city, zip.city) if zip.present?
    end
  end
end
