# encoding: UTF-8
class SendComplaint < ActionMailer::Base
  def send_complaint_to_Inspector
    @complaint = Complaint.last
    @inspectors = User.find_by_role_id(2)
    p '111111111111'
    p @inspectors.email
    mail(:to =>  @inspectors.email, :subject => 'متن شکایت از سایت اتحادیه مسکن', :from => "web.development@raush.ir")
  end
end
