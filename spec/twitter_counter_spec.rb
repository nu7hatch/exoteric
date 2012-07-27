require File.expand_path('../spec_helper', __FILE__)

describe Exoteric::Twitter do
  subject do
    Exoteric::Counter.new(:url => "http://github.com/")
  end

  describe "#twitter_count" do
    it "returns number of tweets" do
      subject.twitter_count.should > 0
    end
  end

  describe "#count" do
    it "returns number of tweets when :twitter param specified" do
      subject.count(:twitter)[:twitter].should > 0
    end
  end
end
