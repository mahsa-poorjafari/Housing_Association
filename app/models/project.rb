# encoding: UTF-8
class Project < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title
  is_impressionable
  has_many :pictures
  has_many :informs
  has_many :pay_limits
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
  has_and_belongs_to_many :users, :class_name => "User", :join_table => "projects_users", :foreign_key => "project_id" 
end
