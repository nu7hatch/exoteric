# -*- encoding: utf-8 -*-
require File.expand_path('../lib/exoteric/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Kowalik"]
  gem.email         = ["chris@nu7hat.ch"]
  gem.description   = %q{Get page statistics from the most popular social networks.}
  gem.summary       = <<-DESCR
Exoteric gives you page statistics from the most popular social networks,
i.a. number of tweets, how many people shared link on facebook or google plus
etc. 
DESCR
  gem.homepage      = "http://github.com/nu7hatch/exoteric/"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "exoteric"
  gem.require_paths = ["lib"]
  gem.version       = Exoteric::VERSION

  gem.add_dependency 'rest-client'
  gem.add_dependency 'json'
  gem.add_dependency 'rack'

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'rack-test'
end
