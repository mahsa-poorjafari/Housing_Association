# encoding: UTF-8
class PayLimit < ActiveRecord::Base
  belongs_to :user  
  belongs_to :project
end