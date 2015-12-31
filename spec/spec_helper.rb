# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'jwt'
require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start

Dir[File.join(File.dirname(__FILE__), "support/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

if ActiveRecord::Migrator.needs_migration?
  ActiveRecord::Migrator.migrate(File.join(Rails.root, 'db/migrate'))
end

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :request
  config.include Requests::RequestHelpers, type: :request

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.around :each do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
