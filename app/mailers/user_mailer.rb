class UserMailer < ActionMailer::Base
  
  def needs_waterhing(user)
    setup_email(user)
    @recipients = "philip@seedly.me"
    @subject << "#{user.name} needs to consider"
  end
  
protected
  def setup_email(user)
    @from = "info@seedly.me"
    @sent_on = Time.now
  end
end