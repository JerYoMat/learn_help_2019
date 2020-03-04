# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.3'

gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'pry'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'database_cleaner'
  gem 'faker'
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'rails-controller-testing'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
