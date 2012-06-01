class UserMailer < ActionMailer::Base
  default :content_type => "text/html", 
    :from => "Seedly <info@seedly.me>",
    :bcc => "dude bcc <philip@seedly.me>"
  
  def welcome(user)
    mail(:to => user.email,
        :subject => "Welcome to Seedly")
  end
  
  def needs_watering(user)
    mail(:to => user.email,
        :subject => "#{user.name} needs to consider watering")
  end
end