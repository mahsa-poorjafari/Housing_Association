#encoding: utf-8
namespace :db do
  desc "creates default pages -> about us and contact us"
  task :add_default_pages => :environment do
    Page.create(:title => "درباره ما") if Page.where(title:"درباره ما").blank?
    Page.create(:title => "تماس با ما") if Page.where(title:"تماس با ما").blank?
    p 'pages created'
  end
  
  desc "creates default roles"
  task :create_default_roles => :environment do
    Role.create(name:"admin") if Role.where(name:"admin").blank?
    Role.create(name:"Inspector") if Role.where(name:"Inspector").blank?
    Role.create(name:"user") if Role.where(name:"user").blank?
    Role.create(name:"cooperative") if Role.where(name:"cooperative").blank?
    p 'roles created'
  end

  desc "creates default users"
  task :create_default_users => :environment do
    User.create(name:"admin", password:"123qwe123", email:"web.development@raush.ir", role_id: '1') if User.where(name:"admin").blank?
    p 'user created'
  end
  
  

end

