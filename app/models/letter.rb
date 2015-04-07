#encoding: utf-8
class Letter < ActiveRecord::Base
  # extend FriendlyId  
  #friendly_id :summary
  extend PersianNumbers
  persian_dates :sent_date, :received_date

  LetterTypes = {sent:"صادره", recieved:"وارده", email: "ارسال ایمیل گروهی"}
  belongs_to :sender, class_name:"Contact", :foreign_key => "sender_id"
  has_and_belongs_to_many :recievers , class_name:"Contact"
  
  has_attached_file :scan_file,
                    :url  => "/assets/circulars/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/circulars/:id/:style/:basename.:extension"
  validates_attachment_content_type :scan_file,
      :content_type => [ 'application/pdf' ],
      :message => "نوع فایل نامعتبر است. فقط فایل پی دی اف مجاز است."
  #def senderpreson_name
  #  self.sender.try(:preson_name) 
  #end
  #def senderpreson_name=(senderperson_name)
  #  senderperson_name.strip!
  #  self.sender = Contact.where(preson_name:senderperson_name).first || Contact.create(preson_name:senderperson_name)
  #end

  #def sendercompany_name
   # self.sender.try(:preson_name) 
  #end
  #def sendercompany_name=(sendercompany_name)
   # sendercompany_name.strip!
   # self.sender = Contact.where(company_name:sendercompany_name).first || Contact.create(company_name:sendercompany_name)
  #end

  def reciever_tokens=(ids)
    self.reciever_ids = ids.split(',')
  end
  def reciever_tokens
  end
end
