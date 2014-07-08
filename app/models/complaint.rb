# encoding: UTF-8
class Complaint < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :subject
  is_impressionable
  has_many :comment_complaints
  
  validates :subject, :user_email, :user_phone, :presence => {:message => 'فیلدها را وارد کنید.'}
  validates :user_email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'ایمیل نامعتبر است.' } 
#validates :subject, format: { with: /\d{3}-\d{3}-\d{4}/, message: "تلفن خود را صحیح وارد کنید." }
end
