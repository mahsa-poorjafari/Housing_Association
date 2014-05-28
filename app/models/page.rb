class Page < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title
  is_impressionable
end
