class UserMailer < ActionMailer::Base
  default :content_type => 'text/html',
    :from => 'Seedly <info@seedly.me>',
    :bcc => 'bcc dude <philip@seedly.me>'
    
  
  def welcome(user)
    @recipients = user.email
    @subject = "Welcome to Seedly"
  end
  
  def needs_watering(user)
    @recipients = user.email
    @subject = "#{user.name} needs to consider watering"
  end
  
end