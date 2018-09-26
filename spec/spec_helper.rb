require 'bundler/setup'
require 'aemet_opendata'
require 'vcr'
require 'typhoeus/adapters/faraday'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday
  c.allow_http_connections_when_no_cassette = false
  c.filter_sensitive_data("<API_KEY>") { AemetOpendata.api_key }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.before(:each) do
    AemetOpendata.api_key = nil
  end
end
