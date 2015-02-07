$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sendvia'
require 'vcr'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  VCR.configure do |c|
    c.cassette_library_dir = "./spec/vcr_cassettes"
    c.configure_rspec_metadata!
    c.hook_into :webmock
    c.ignore_localhost = true
  end
end
