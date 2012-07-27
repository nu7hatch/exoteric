require File.expand_path('../spec_helper', __FILE__)

describe Exoteric::Facebook do
  subject do
    Exoteric::Counter.new(:url => "http://github.com/")
  end

  describe "#facebook_count" do
    it "returns number of facebook likes" do
      subject.facebook_count.should > 0
    end
  end

  describe "#count" do
    it "returns number of facebook likes when :facebook param specified" do
      subject.count(:facebook)[:facebook].should > 0
    end
  end
end
