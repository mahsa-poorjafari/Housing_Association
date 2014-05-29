class Complaint < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :subject
  has_many :comment_complaints
end
