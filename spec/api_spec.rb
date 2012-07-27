require File.expand_path('../spec_helper', __FILE__)
require 'exoteric/api'

describe Exoteric::API do
  let :app do
    Exoteric::API.new
  end

  describe "resources" do
    before do
      Exoteric::Counter.stubs(:counters).returns(:test)
      Exoteric::Counter.any_instance.stubs(:test_count).returns(10)
    end

    describe "/count.json" do
      it "returns popularity count from selected networks" do
        get "/count.json?url=http://github.com/&n=test"
        last_response.should be_ok
        JSON.parse(last_response.body)['test'].should == 10
      end
      
      it "returns an error when no url specified" do
        get "/count.json?url=&n=test"
        last_response.should_not be_ok
        JSON.parse(last_response.body)['error'].should == 'Site url not specified'
      end
    end

    describe "/count.js" do
      it "returns script with preloaded counter values and executed callback" do
        get "/count.js?url=http://github.com/&n=test&cb=testCallback"
        last_response.should be_ok
        last_response.body.should =~ /testCallback\(\)/
        last_response.body.should =~ /\{\"test\":10\}/
      end

      it "returns script with preloaded counter values and no callback if not specified" do
        get "/count.js?url=http://github.com/&n=test"
        last_response.should be_ok
        last_response.body.should =~ /\{\"test\":10\}/
      end

      it "returns an error when no url specified" do
        get "/count.js?url=&n=test"
        last_response.should_not be_ok
        JSON.parse(last_response.body)['error'].should == 'Site url not specified'
      end
    end
  end
end
