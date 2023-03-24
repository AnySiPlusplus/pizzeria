source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').split.join

gem 'activeadmin'
gem 'activeadmin_addons'
gem 'aws-sdk-s3'
gem 'bootsnap', require: false
gem 'cancancan'
gem 'country_select', '~> 6.0'
gem 'cssbundling-rails'
gem 'devise'
gem 'draper'
gem 'factory_bot_rails'
gem 'ffaker'
gem 'haml-rails'
gem 'image_processing'
gem 'interactor', '~> 3.0'
gem 'jsbundling-rails'
gem 'money-rails', '~>1.12'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'pagy', '~> 5.10'
gem 'pg', '~> 1.1'
gem 'phonelib'
gem 'pry'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.4'
gem 'reform-rails'
gem 'sassc-rails'
gem 'shrine', '~> 3.4'
gem 'simple_form'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "spring"
  gem 'bullet'
  gem 'capybara'
  gem 'letter_opener'
  gem 'rspec-rails', '6.0.0.rc1'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver', '~> 4.1'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
  gem 'site_prism', '~> 3.7.3'
end

group :development do
  gem 'brakeman', require: false
  gem 'bundle-audit', require: false
  gem 'fasterer', require: false
  gem 'lefthook', require: false
  gem 'rubocop', require: false
  gem 'rubocop-i18n', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
