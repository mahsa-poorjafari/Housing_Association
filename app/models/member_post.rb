# encoding: UTF-8
class MemberPost < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title
  validates :title, :presence => {:message => 'فیلد های ستاره دار را پر کنید'}
  
  validates :title, :uniqueness => {:message => 'عنوان در سیستم وجود دارد'}
  has_many :members
end
