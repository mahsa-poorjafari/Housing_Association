# encoding: UTF-8
class PayLimit < ActiveRecord::Base
  belongs_to :user  
  belongs_to :project
  belongs_to :partnership
  
  validates :project_id, :presence => {:message => 'لطفا پروژه موردنظر را انتخاب کنید'}      
  
  def self.search(search)
    search_condition = "%" + search + "%"  
    find(:all, :conditions => ['tracking_code LIKE :s', :s => search_condition])
  end
  
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
  
end
