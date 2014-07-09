# encoding: UTF-8
class Member < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :last_name
  has_attached_file :image, :styles => { :original => "500x500>" , :medium => "300x300>", :small => "200x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  belongs_to :cooperative
  belongs_to :member_posts
end
