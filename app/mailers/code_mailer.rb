# encoding: UTF-8
class CodeMailer < ActionMailer::Base
  def send_pro_reg_code
    @reg_pro = PayLimit.last
    mail(:to =>  @reg_pro.user.email, :subject => 'اتحادیه مسکن -  ثبت نام در پروژه', :from => "web.development@raush.ir")
  end
end
