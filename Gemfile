source 'https://rubygems.org'

gem 'rails', '4.2.1'
gem 'responders', '~> 2.0'
gem 'mysql2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'bower-rails'
gem "active_model_serializers"
gem 'dalli'
gem 'figaro'
gem 'simple_form'
gem 'foundation-rails', '~> 5.4.5'
gem 'friendly_id'
gem 'paperclip'
gem 'aws-sdk'
gem 'acts_as_list'
gem 'acts_as_tree'
gem 'devise'
gem 'activeadmin', git: 'https://github.com/activeadmin/activeadmin'
gem 'activeadmin-sortable'

gem 'sdoc', '~> 0.4.0',          group: :doc

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'

  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'sshkit'
  gem 'colorize', '0.7.4' # version 0.7.5 caused problems deploying
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'jasmine-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'ZenTest'
  gem 'simplecov', require: false
  gem 'rspec-autotest'
  gem 'json-schema'
  gem 'faker'
  gem 'launchy'
  gem 'selenium-webdriver'
end
