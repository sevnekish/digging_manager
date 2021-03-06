source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'puma', '~> 3.11'
gem 'pg', '>= 0.18', '< 2.0'

gem 'dotenv-rails'

gem 'dry-monads'
gem 'dry-validation'
gem 'active_model_serializers'

gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'activerecord-postgis-adapter'

gem 'pagy'

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'byebug'
end

group :development do
  gem 'annotate'
  gem 'rubocop', '~> 0.82.0', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'capybara'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
