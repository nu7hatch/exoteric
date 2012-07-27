require 'rspec'
require 'minitest/unit'
require 'mocha'

require 'exoteric'

RSpec.configure do |conf|
  conf.mock_with "mocha"
end
