source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "3.2.2"

gem "active_storage_validations", "0.9.8"
gem "bcrypt", "3.1.13"
gem "bootsnap", require: false
gem "bootstrap", "~> 5.1.3"
gem "config"
gem "dotenv-rails", require: "dotenv"
gem "faker"
gem "htmlbeautifier"
gem "image_processing", "1.12.2"
gem "importmap-rails"
gem "jbuilder"
gem "jquery-rails"
gem "mysql2", "~> 0.5"
gem "pagy", "~> 6.0"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.5"
gem "sassc-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
group :development, :test do
  gem "debug", platforms: %i(mri mingw x64_mingw)
  gem "rspec-rails", "~> 4.0.1"
  gem "rubocop", "~> 1.26", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.14.0", require: false
end
group :development do
  gem "web-console"
end
group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
