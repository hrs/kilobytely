require 'bundler/setup'
require 'rspec/core'
require 'rack/test'

require 'kilobytely'
require 'kilobytely_server'

RSpec.configure do |config|
  config.mock_with :rspec
end
