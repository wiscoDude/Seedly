class UserMailer < ActionMailer::Base
  
  def welcome_email(user)
    setup_email(user)
    @recipients = user.email
    @bcc = "info@seedly.me"
    @subject = "Welcome to Seedly"
  end
  
  def needs_watering(user)
    setup_email(user)
    @recipients = user.email
    @subject = "#{user.name} needs to consider watering"
  end
  
protected
  def setup_email(user)
    @from = "info@seedly.me"
    @sent_on = Time.now
  end
end