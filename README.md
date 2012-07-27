# Exoteric

Exoteric gives you page statistics from the most popular social networks, i.a.
number of tweets, how many people shared link on facebook or google plus
etc. 

## Installation

Add this line to your application's Gemfile:

    gem 'exoteric'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exoteric

## Usage

Pretty simple stuff:

    counter = Exoteric.new(:url => 'http://github.com/')
    counter.count(:twitter, :facebook, :plusone)

Leaving requested counters blank or specifying `:all` will cause that
all registered APIs will be used to gather page popularity:

    counter.count # shortcut for counter.count(:all)
    
Some APIs required extra parameters, eg. to get github watchers for
the repository you must specify `:github_repo` option:

    counter = Exoteric.new(
      :url         => 'http://desantapp.com/', 
      :github_repo => 'nu7hatch/desantapp'
    )
    counter.count(:github)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
