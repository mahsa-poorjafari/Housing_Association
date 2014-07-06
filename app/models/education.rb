# encoding: UTF-8 
class Education < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title
  has_attached_file :pdf,
                    :url  => "/assets/circulars/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/circulars/:id/:style/:basename.:extension"

  validates_attachment_content_type :pdf,
      :content_type => [ 'application/pdf' ],
      :message => "نوع فایل نامعتبر است. فقط فایل پی دی اف مجاز است."
end
