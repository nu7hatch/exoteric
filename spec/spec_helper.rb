require 'rspec'
require 'minitest/unit'
require 'mocha'
require 'rack/test'

require 'exoteric'

RSpec.configure do |conf|
  conf.mock_with "mocha"  
  conf.include Rack::Test::Methods
end

