require "exoteric/version"
require "exoteric/counter"

module Exoteric
  def self.new(options)
    Counter.new(options)
  end
end
