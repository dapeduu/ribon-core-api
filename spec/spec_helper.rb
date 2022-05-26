require 'simplecov'
SimpleCov.start 'rails' do
  add_group "Blueprints", "app/blueprints"
  add_filter 'lib/generators'
  add_filter 'lib/simple_command'
  add_filter 'lib/redis_store'
  add_filter 'app/services/graphql/queries'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
