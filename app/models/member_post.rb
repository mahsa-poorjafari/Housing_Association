# encoding: UTF-8
class MemberPost < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title
  validates :name, :last_name, :mobile, :father_name, :presence => {:message => 'فیلد های ستاره دار را پر کنید'}    
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'ایمیل نامعتبر است.' } 
  validates :mobile, format: { with: /\d{10}/, message: "لطفا ده رقم شماره تلفن همراه خود را بدون صفر وارد کنید." }
  has_many :members
end
