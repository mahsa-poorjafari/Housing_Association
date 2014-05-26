class Project < ActiveRecord::Base
  has_many :pictures
  has_many :informs
  has_many :pay_limits
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
  has_and_belongs_to_many :users, join_table: :projects_users
end
