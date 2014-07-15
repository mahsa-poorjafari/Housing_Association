#encoding: utf-8
namespace :db do
  desc "creates default pages -> about us and contact us"
  task :add_default_pages => :environment do
    Page.create(:title => "درباره ما") if Page.where(title:"درباره ما").blank?
    Page.create(:title => "تماس با ما") if Page.where(title:"تماس با ما").blank?
    p "#{Page.count} pages created"
  end
  
  desc "creates default roles"
  task :create_default_roles => :environment do
    Role.create(name:"admin") if Role.where(name:"admin").blank?
    Role.create(name:"Inspector") if Role.where(name:"Inspector").blank?
    Role.create(name:"user") if Role.where(name:"user").blank?
    Role.create(name:"cooperative") if Role.where(name:"cooperative").blank?
    p "#{Role.count} roles created"
  end

  desc "creates default users"
  task :create_default_users => :environment do
    User.create(name:"admin", password:"123qwe123", email:"admin@maskan-ef.com", role_id: '1') if User.where(name:"admin").blank?
    User.create(name:"Inspector", password:"123qwe123", email:"Inspector@maskan-ef.com", role_id: '2') if User.where(name:"Inspector").blank?
    p "#{User.count} users created"
  end
   desc "creates default member post"
  task :create_default_member_posts => :environment do
    MemberPost.create(title:  'عضو تعاونی') if MemberPost.where(title: 'عضو تعاونی').blank?
    MemberPost.create(title: 'عضو هیئت مدیره') if MemberPost.where(title: 'عضو هیئت مدیره').blank?
    MemberPost.create(title: 'رئیس هیئت مدیره') if MemberPost.where(title: 'رئیس هیئت مدیره').blank?
    MemberPost.create(title: 'بازرس') if MemberPost.where(title: 'بازرس').blank?
    MemberPost.create(title: 'نائب رئیس') if MemberPost.where(title: 'نائب رئیس').blank?
    MemberPost.create(title: 'مدیرعامل') if MemberPost.where(title: 'مدیرعامل').blank?
    p "#{MemberPost.count} MemberPosts created"
  end
  
  desc "creates test contact"
  task :create_test_contacts => :environment do
    Contact.create(preson_name:  'مدیر شرکت تست', company_name: 'نام شرکت تست') if Contact.where(preson_name: 'مدیر شرکت تست').blank?
    p "#{Contact.count} MemberPosts created"
  end
    

end

