namespace :db do

  namespace :staging do

    task create_user: :environment do
      if ENV['staging_user_email'] && ENV['staging_user_password']
        unless AdminUser.exists?(email: ENV['staging_user_email'])
          user = AdminUser.create(
            email: ENV['staging_user_email'],
            password: ENV['staging_user_password'],
            password_confirmation: ENV['staging_user_password']
          )
          puts "Staging user created with id: ##{ user.id }"
        else
          puts "Staging user already present in database."
        end
      else
        puts "Staging user details not found in config."
      end
    end
  end

end
