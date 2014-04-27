# encoding: UTF-8
class Payment < ActiveRecord::Base
  has_and_belongs_to_many :registered, :class_name => "User", :join_table => "projects_payments", :foreign_key => "payment_id"
end
