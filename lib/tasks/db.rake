#encoding: utf-8
namespace :db do
  desc "creates default pages -> about us and contact us"
  task :add_default_pages => :environment do
    Page.create(:title => "درباره ما") if Page.where(title:"درباره ما").blank?
    Page.create(:title => "تماس با ما") if Page.where(title:"تماس با ما").blank?
    p 'pages created'
  end

  desc "creates default users"
  task :create_default_users => :environment do
    User.create(name:"admin", password:"123qwe", email:"web.development@raush.ir") if User.where(name:"admin").blank?
    p 'user created'
  end

end

