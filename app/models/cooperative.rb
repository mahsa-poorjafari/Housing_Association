# encoding: UTF-8
class Cooperative < ActiveRecord::Base   
  extend FriendlyId  
  friendly_id :name
  validates :email_company, :presence => {:message => 'فیلد های ستاره دار را پر کنید'}
  validates :email_company, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'ایمیل نامعتبر است.' } 
  validates :email_company, :uniqueness => {:message => 'ایمیل در سیستم وجود دارد'}
  
  has_many :upload_files
  has_many :members
  has_one :phone_book
  has_one :contact
  
  
  def self.search(search)
    search_condition = "%" + search + "%"  
    find(:all, :conditions => ['name LIKE ? OR managment_name LIKE ?', search_condition, search_condition])
  end
  
end
