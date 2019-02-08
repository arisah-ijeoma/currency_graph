# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  #
  # stubbing API external calls
  config.before(:each) do
    stub_request(:get, /api.exchangeratesapi.io/).with(
      headers: {
        'Accept'=>'*/*', 'User-Agent'=>'Ruby'
      }
    ).to_return(
      status: 200,
      body: {
        "base": "USD",
        "date": "2019-02-08",
        "rates": {
          "ISK": 120.218579235,
          "CAD": 1.3306892297,
          "MXN": 19.0400141019,
          "CHF": 1.0009695047,
          "AUD": 1.4107174335,
          "CNY": 6.7448439979,
          "GBP": 0.7711087608,
          "USD": 1,
          "SEK": 9.2519830777,
          "NOK": 8.6103472589,
          "TRY": 5.2430812621,
          "IDR": 13965.0008813679,
          "ZAR": 13.6098184382,
          "HRK": 6.528732593,
          "EUR": 0.881367883,
          "HKD": 7.8459368941,
          "ILS": 3.6341441918,
          "NZD": 1.4814912745,
          "MYR": 4.069539926,
          "JPY": 109.7919971796,
          "CZK": 22.7445795875,
          "SGD": 1.3551912568,
          "RUB": 65.933809272,
          "RON": 4.1851753922,
          "HUF": 280.5658381809,
          "BGN": 1.7237793055,
          "INR": 71.272254539,
          "KRW": 1122.8274281685,
          "DKK": 6.5780010576,
          "THB": 31.4851048828,
          "PHP": 52.1320289089,
          "PLN": 3.7955226512,
          "BRL": 3.7101181033
        }
      }.to_json,
      headers: {}
    )
  end
end
