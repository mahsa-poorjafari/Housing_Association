class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :projects, :class_name => "Project", :join_table => "projects_users", :foreign_key => "user_id"
  has_many :payments
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
end
