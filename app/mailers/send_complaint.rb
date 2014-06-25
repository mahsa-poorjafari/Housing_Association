# encoding: UTF-8
class SendComplaint < ActionMailer::Base
  def send_complaint_to_Inspector
    @complaint = Complaint.last
    @inspectors = User.find_by_role_id(2)
    p 'send_complaint_to_Inspector'
    p @inspectors.email
    mail(:to =>  'raush.co@gmail.com', :subject => 'پرسش از سمت کاربر سایت ', :from => "web.development@raush.ir")
  end
  
  
  def admin_confirm_answer
    @complaint= Complaint.last
    p 'admin_confirm_answer'
    mail(:to =>  @complaint.user_email, :subject => 'نتیجه داوری برای پرسش شما', :from => "web.development@raush.ir")
  end
end
