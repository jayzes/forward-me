require 'database_cleaner'
require 'sucker_punch/testing/inline'

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # Clean up all feature specs with truncation
  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :truncation
  end

  # Clean up all jobs specs with truncation
  config.before(:each, job: true) do
    DatabaseCleaner.strategy = :truncation
  end


  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
