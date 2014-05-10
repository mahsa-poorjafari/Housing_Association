module ApplicationHelper

  def is_admin? 
    session.present?
  end
  def is_user? 
    session[:user].present?
  end
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
  
  
end
