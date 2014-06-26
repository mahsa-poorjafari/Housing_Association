# encoding: UTF-8
class CommentComplaint < ActiveRecord::Base

  belongs_to :user
  belongs_to :complaint
  validates :user_email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'ایمیل نامعتبر است.' } 
end
