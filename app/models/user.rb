class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :projects, join_table: :projects_users
  has_and_belongs_to_many :roles, join_table: :roles_users
  
  has_many :payments
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
end
