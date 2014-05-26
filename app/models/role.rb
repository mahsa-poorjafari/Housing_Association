# encoding: UTF-8
class Role < ActiveRecord::Base
  has_many :users
  validates :name, :uniqueness => {:message => 'عنوان تکراری است'}
  validates :name, :presence => {:message => 'عنوان را بنویسید'}
end
