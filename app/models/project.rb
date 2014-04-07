class Project < ActiveRecord::Base
  has_many :pictures
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
end
