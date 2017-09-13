require 'minitest/autorun'
require 'minitest/test'
require 'vcr'


VCR.configure do |config|
  config.cassette_library_dir = "tests/cassettes"
  config.hook_into :webmock
end
