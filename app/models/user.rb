class User < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_and_belongs_to_many :projects, :class_name => "Project", :join_table => "projects_users", :foreign_key => "user_id" 
  belongs_to :role
  
  
  
  has_many :pay_limits
  
  def is_admin?
    self.name == "admin"
  end  
  
  def is_user?
    self.role.name == "user"
  end  
  def is_inspector?
    self.role.name == "Inspector"
  end 
 
end
