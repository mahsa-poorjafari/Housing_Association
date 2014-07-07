# encoding: UTF-8
class UserMailer < ActionMailer::Base
  default from: "web.development@raush.ir"
  
  def send_user_mail
    mail(to: 'mahsa.poorjafari@gmail.com', subject: 'house')
  end
  def send_cooperative_mail(generated_password)
    @generated_password = generated_password
    @cooperative = User.last
    mail(to: @cooperative.email, subject: 'ثبت این تعاونی به عنوان کاربر عضو', :from => "web.development@raush.ir")
  end
  
end
