# encoding: UTF-8
class Partnership < ActiveRecord::Base
  has_many :pay_limits
  validates :first_name, :last_name, :email, :father_name, :mobile, :presence => {:message => 'فیلد های ستاره دار را پر کنید'}
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'ایمیل نامعتبر است.' } 
  validates :email, :uniqueness => {:message => 'ایمیل در سیستم وجود دارد'}
end
