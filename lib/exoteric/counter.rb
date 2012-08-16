require 'json'
require 'rest_client'
require 'thread'
require 'timeout'

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
      
      res = {}
      sem = Mutex.new
      threads = []

      counters.each do |name|
        threads << Thread.new do 
          sem.synchronize { res[name] = send("#{name}_count") }
        end
      end

      Timeout.timeout(10) do
        threads.each(&:join)
      end
    rescue Timeout::Error
      # nothing to do...
    ensure
      return res
    end
  end
end

require 'exoteric/counters/twitter'
require 'exoteric/counters/facebook'
require 'exoteric/counters/google_plus'
require 'exoteric/counters/github'
