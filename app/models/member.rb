# encoding: UTF-8
class Member < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :last_name
  has_attached_file :image, :styles => { :original => "500x500>" , :icon => "100x100>", :small => "200x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

 
  validates :name, :last_name, :mobile, :father_name, :presence => {:message => 'فیلد های ستاره دار را پر کنید'}      
  validates :mobile, format: { with: /[1234567890۱۲۳۴۵۶۷۸۹۰]{10}/, message: "لطفا ده رقم شماره تلفن همراه خود را بدون صفر وارد کنید." }
  
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'ایمیل نامعتبر است.' } , :unless => proc{|member| member.email.blank?}
  

  
  
  belongs_to :cooperative
  belongs_to :member_post
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['last_name LIKE ? ', search_condition, ])
  end
end
