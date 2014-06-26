# encoding: UTF-8
class StaticController < ApplicationController
  impressionist :actions=>[:show,:index]
  def home
    @informs = Inform.order(" created_at desc")
    @projects = Project.all
    if current_user.present?
      @login = current_user
    end      
  end
  def index
    @about = Page.where(title: "درباره ما")
    @contact = Page.where(title: "تماس با ما")
    @complaints = Complaint.where( display: true).order(" created_at desc")
  end
end
