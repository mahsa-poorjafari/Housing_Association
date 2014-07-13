# encoding: UTF-8
class StaticController < ApplicationController
  impressionist :actions=>[:show,:index]

  def index
    @about = Page.where(title: "درباره ما")
    @contact = Page.where(title: "تماس با ما")
    @complaints = Complaint.where( display: true).order(" created_at desc")
    @articles = Article.order(" created_at desc")
    @circulars = Circular.order(" created_at desc")
    @educations = Education.order(" created_at desc")
    @forms = PdfForm.order(" created_at desc")
    
    
    
  end
  
end
