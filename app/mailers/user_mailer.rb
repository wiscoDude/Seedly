class UserMailer < ActionMailer::Base
  
  def needs_watering(user)
    setup_email(user)
    @recipients = "philip@seedly.me"
    @subject << "#{user.name} needs to consider watering"
  end
  
protected
  def setup_email(user)
    @from = "info@seedly.me"
    @sent_on = Time.now
  end
end