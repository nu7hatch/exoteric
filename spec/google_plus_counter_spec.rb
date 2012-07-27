require File.expand_path('../spec_helper', __FILE__)

describe Exoteric::GooglePlus do
  subject do
    Exoteric::Counter.new(:url => "http://github.com/")
  end

  describe "#plusone_count" do
    it "returns number of plusone shares" do
      subject.plusone_count.should > 0
    end
  end

  describe "#count" do
    it "returns number of plusone shares when :plusone param specified" do
      subject.count(:plusone)[:plusone].should > 0
    end
  end
end
