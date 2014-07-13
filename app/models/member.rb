# encoding: UTF-8
class Member < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :last_name
  has_attached_file :image, :styles => { :original => "500x500>" , :icon => "100x100>", :small => "200x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :title, :presence => {:message => 'فیلد های ستاره دار را پر کنید'}  
  validates :title, :uniqueness => {:message => 'عنوان در سیستم وجود دارد'}
  
  
  belongs_to :cooperative
  belongs_to :member_post
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['last_name LIKE ? ', search_condition, ])
  end
end
