#encoding: utf-8
class Letter < ActiveRecord::Base
  extend PersianNumbers
  persian_dates :sent_date, :received_date

  LetterTypes = {sent:"ارسالی", recieved:"دریافتی"}
  belongs_to :sender, class_name:"Contact", :foreign_key => "sender_id"
  has_and_belongs_to_many :recievers , class_name:"Contact"

  def senderpreson_name
    self.sender.try(:preson_name) 
  end
  def senderpreson_name=(senderperson_name)
    senderperson_name.strip!
    self.sender = Contact.where(preson_name:senderperson_name).first || Contact.create(preson_name:senderperson_name)
  end

  def reciever_tokens=(ids)
    self.reciever_ids = ids.split(',')
  end
  def reciever_tokens
  end
end
