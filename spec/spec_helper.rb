require "bundler/setup"
require "rspec/core"
require "rack/test"

require "kilobytely"
require "kilobytely_server"

set :environment, :test

RSpec.configure do |config|
  config.mock_with :rspec
end
