# encoding: UTF-8
class UrlMailer < ActionMailer::Base
  def send_friend_link
    @link = SendLink.last
    mail(:to =>  @link.receiver_email, :subject => @link.subject, :from => @link.sender_email)
  end

end
