class Management < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :last_name
  has_attached_file :image, :styles => { :icon => "50x50#" , :original => "500x500>" , :medium => "300x300>", :small => "200x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
