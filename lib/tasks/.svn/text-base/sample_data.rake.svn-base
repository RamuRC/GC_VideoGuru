namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Administrator",
                         :email => "admin@amazonmustdie.com",
                         :password => "password2",
                         :password_confirmation => "password2")
    admin.toggle!(:admin)

	User.create!(:name => "Owais Ahmed",
                 :email => "owais@hotmail.com",
                 :password => "password",
                 :password_confirmation => "password")
    99.times do |n|
      name  = "John Doe"
      email = "example-#{n+1}@hotmail.com"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end