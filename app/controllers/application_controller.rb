# encoding: UTF-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper 
  
  before_filter :configure_permitted_parameters, if: :devise_controller? 
  
  before_filter :authenticate



  
  
  # my custom fields are :name, :heard_how
  def configure_permitted_parameters    
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :last_name, :phone, :mobile, :birthdate, :address, :national_code,
         :email, :password, :password_confirmation, :current_password)
    end
  end
  
  protected
    def check_autentication
      redirect_to :root unless is_admin?
    end
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "foo" && password == "bar"
    end
  end
  
end
