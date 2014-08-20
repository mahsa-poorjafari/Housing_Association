# encoding: UTF-8
class UserMailer < ActionMailer::Base
  default from: "info@maskan-ef.com"
  
  def send_user_mail
    mail(to: 'mahsa.poorjafari@gmail.com', subject: 'house')
  end
  def send_cooperative_mail(generated_password)
    @generated_password = generated_password
    @cooperative = User.last
    mail(to: @cooperative.email, subject: 'ثبت این تعاونی به عنوان کاربر عضو', :from => "web.development@raush.ir")
  end
  def send_inspector_mail(generated_password)
    @generated_password = generated_password
    @inspector = User.last
    mail(to: @inspector.email, subject: 'شما به عنوان بازرس در سیستم تعریف شدید.', :from => "web.development@raush.ir")
  end
  
  def send_group_mail(letter)
    letter.recievers.each do  |reciever|  
      p 'reciever email -------------'      
      @reciever = reciever
      @letter = letter        
      if reciever.cooperative_id.present?        
        mail(to: letter.recievers.collect(&:email).join(','), subject: letter.summary , :from => "web.development@raush.ir")
      end
    end
  end  
end
