#encoding: utf-8
namespace :db do
  desc "creates default pages -> about us and contact us"
  task :add_default_pages => :environment do
    Page.create(:title => "درباره ما") if Page.where(title:"درباره ما").blank?
    Page.create(:title => "تماس با ما") if Page.where(title:"تماس با ما").blank?
  end

  desc "creates default users"
  task :create_default_users => :environment do
    User.create(password:"123qwe", email:"mahsa.poorjafari@gmail.com") 
  end

end

