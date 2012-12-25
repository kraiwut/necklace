namespace :user do

  task :"create:siteadmin" => :environment do
    if ENV['NAME'].present? && ENV['EMAIL'].present? && ENV['PASSWORD'].present?
      name = ENV['NAME'].dup
      email = ENV['EMAIL'].dup 
      password = ENV['PASSWORD'].dup
      SiteAdmin.create!(:username => name, :email => email, :password => password)
        .activate
      unless Rails.env.test?
        puts "Successfully created site admin"
      end
    else
      unless Rails.env.test?
        puts "Could not create site admin!"
        puts "==============================================================================="
        puts "Usage: rake user:create:siteadmin EMAIL=[*email] PASSWORD=[*password] NAME=[*name]"
        puts "* are required parameters"
        puts "==============================================================================="
      end
    end
  end

end