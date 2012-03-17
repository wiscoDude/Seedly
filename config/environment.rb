# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Seedly::Application.initialize!

ActionMailer::Base.smtp_settings = {
:user_name => "app2169023@heroku.com",
:password => ENV['SENDGRID_PASSWORD'],
:domain => "seedly.me",
:address => "smtp.sendgrid.net",
:port => 587,
:authentication => :plain,
:enable_starttls_auto => true
}