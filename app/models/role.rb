# encoding: UTF-8
class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: :roles_users
  validates :name, :uniqueness => {:message => 'عنوان تکراری است'}
  validates :name, :presence => {:message => 'عنوان را بنویسید'}
end
