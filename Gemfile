source 'https://rubygems.org'

gem 'rails', '4.1.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem "unicorn"
gem "airbrake"
gem "newrelic_rpm"
gem "haml-rails"

gem 'griddler'
gem 'sucker_punch'

group :development, :test do
  gem 'spring'
  gem "spring-commands-rspec", require: false
  gem "rspec-rails", '~> 3.0.0.beta'
  gem "teaspoon", github: "modeset/teaspoon"
  gem "dotenv-rails"
  gem "pry-rails"
  gem "foreman"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "selenium-webdriver"
end

group :staging, :production do
  gem "heroku-deflater"
  gem "lograge"
  gem "rails_12factor"
end
