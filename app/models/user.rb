# encoding: UTF-8
class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_and_belongs_to_many :projects, :class_name => "Project", :join_table => "projects_users", :foreign_key => "user_id" 
  belongs_to :role
  before_save :set_role
  
  
  has_many :pay_limits
  has_many :comment_complaints
  
  def is_admin?
    self.role_id == 1
  end  
  
  def is_user?
    self.role.name == "cooperative"
  end  
  
  def is_inspector?
    self.role.name == "Inspector"
  end 
  
 
  
  def set_role 
    self.role_id = 3 if self.role_id.blank?
  end
  
 
end
