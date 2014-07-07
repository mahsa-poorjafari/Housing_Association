class PhoneBook < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :preson_name
end
