require 'json'
require 'rest_client'

module Exoteric
  class Counter
    attr_reader :url, :options

    def self.<<(counter)
      send :include, counter
      counters << counter.id
    end

    def self.counters
      @counters ||= []
    end
    
    def initialize(options = {})
      @url, @options = options[:url], options
      raise ArgumentError, "Site url not specified" if @url.to_s.empty?
    end

    def count(*counters)
      if counters.size == 0 || counters.first == :all
        counters = self.class.counters
      end

      counters.inject({}) do |res, name|
        res[name] = send("#{name}_count")
        res
      end
    end
  end
end

require 'exoteric/counters/twitter'
require 'exoteric/counters/facebook'
require 'exoteric/counters/google_plus'
require 'exoteric/counters/github'
