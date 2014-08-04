# encoding: UTF-8
class Complaint < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :subject
  is_impressionable
  has_many :comment_complaints
  
  validates :subject, :user_email, :user_phone, :presence => {:message => 'فیلدها را وارد کنید.'}
  validates :user_email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'ایمیل نامعتبر است.' } 
  validates :user_phone, format: { with: /\d{10}/, message: "لطفا ده رقم شماره تلفن همراه خود را بدون صفر وارد کنید." }
end
