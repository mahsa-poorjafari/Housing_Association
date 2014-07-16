class Contact < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :preson_name
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['preson_name LIKE ? OR company_name LIKE ?', search_condition, search_condition])
  end
  belongs_to :cooperative
end
