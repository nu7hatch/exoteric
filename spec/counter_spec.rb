require File.expand_path('../spec_helper', __FILE__)

describe Exoteric::Counter do
  describe ".new" do
    it "raises ArgumentError when no :url specified" do
      expect { Exoteric::Counter.new }.to raise_error(ArgumentError)
    end

    it "returns new instance when url specified" do
      c = Exoteric::Counter.new(:url => 'http://github.com/')
      c.should be
      c.url.should == 'http://github.com/'
      c.options.should have_key(:url)
    end
  end

  describe "#count" do
    subject do
      Exoteric::Counter.new(:url => 'http://github.com/').tap do |c|
        c.class.stubs(:counters).returns([:test])
        c.expects(:test_count).returns(10)
      end
    end

    it "counts popularity in specified social networks" do
      res = subject.count(:test)
      res[:test].should == 10
    end

    it "returns count from all registered apis when no params" do
      res = subject.count
      res[:test].should == 10
    end

    it "returns count from all registered apis when :all specified" do
      res = subject.count(:all)
      res[:test].should == 10
    end
  end
end
