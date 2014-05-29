# encoding: UTF-8
class CommentComplaint < ActiveRecord::Base

  belongs_to :user
  belongs_to :complaint
end
