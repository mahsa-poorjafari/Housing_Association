# encoding: UTF-8
class Slide < ActiveRecord::Base
  is_impressionable
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  has_attached_file :image, :styles => { :small => "500x50",
                                        :gallery_size => {:geometry => "1600x750^", :processors => [:jcropper]}}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
end
