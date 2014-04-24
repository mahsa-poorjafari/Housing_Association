class UserMailer < ActionMailer::Base
  default from: "web.development@raush.ir"
  
  def send_user_mail
    mail(to: 'mahsa.poorjafari@gmail.com', subject: 'house')
  end
  
end
