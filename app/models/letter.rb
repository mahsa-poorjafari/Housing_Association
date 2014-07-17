#encoding: utf-8
class Letter < ActiveRecord::Base
  LetterTypes = {sent:"ارسالی", recieved:"دریافتی"}
  belongs_to :sender, class_name:"Contact", :foreign_key => "sender_id"

  def senderpreson_name
    self.sender.try(:preson_name) || '-'
  end
  def senderpreson_name=(senderperson_name)
    senderperson_name.strip!
    self.sender = Contact.where(preson_name:senderperson_name).first || Contact.create(preson_name:senderperson_name)
  end


end
