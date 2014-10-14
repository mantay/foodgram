source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
# Use sqlite3 as the database for Active Record
group :development, :test do 
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'rspec-its'
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'twitter-bootswatch-rails'
gem 'twitter-bootswatch-rails-helpers'
gem 'bootstrap-will_paginate'
# To use Less
gem 'therubyracer'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'omniauth-instagram'

gem 'faker'

group :production do 
  gem 'pg'
  gem 'rails_12factor'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
end

group :development do 
  gem 'spring'
end