require 'exoteric'
require 'benchmark'

$counter  = Exoteric::Counter.new(:url => "http://areyoufuckingcoding.me/")

n = 5

Benchmark.bm do |bm|
  bm.report("Counter#count") { n.times { |x| $counter.count(:twitter, :plusone, :facebook) }}
end
