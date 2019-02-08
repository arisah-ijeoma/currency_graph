source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.4.0'
gem 'sassc-rails', '>= 2.0.0'
# Assist bootstrap
gem 'jquery-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# for the charts
gem 'chartkick'
gem 'highcharts-rails'

# parsing api requests
gem 'httparty', '~> 0.13.7'

group :development, :test do
  # DEBUGGING
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails'

  # TESTING
  # testing framework
  gem 'rspec-rails', '~> 3.8'
  # mocking external apis
  gem 'webmock', '~> 2.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
