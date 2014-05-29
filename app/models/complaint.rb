class Complaint < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :subject
  is_impressionable
  has_many :comment_complaints
end
