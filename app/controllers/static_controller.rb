# encoding: UTF-8
class StaticController < ApplicationController
  impressionist :actions=>[:show,:index]
  def home
    @informs = Inform.all
    @projects = Project.all
    if current_user.present?
      @login = current_user
    end  
    
    
  end
end
