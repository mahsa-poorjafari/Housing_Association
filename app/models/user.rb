class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_and_belongs_to_many :projects, :class_name => "Project", :join_table => "projects_users", :foreign_key => "user_id" 
  belongs_to :role
  
  before_save :set_role
  
  has_many :pay_limits
  
  def is_admin?
    self.role.name = "admin"
  end  
  
  def is_user?
    self.role.name = "user"
  end  
  private
    def set_role
      self.role_id = 3
    end 
  
end
