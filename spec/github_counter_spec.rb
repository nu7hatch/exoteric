require File.expand_path('../spec_helper', __FILE__)

describe Exoteric::Github do
  subject do
    Exoteric::Counter.new(
      :url => 'http://areyoufuckingcoding.me',
      :github_repo => 'nu7hatch/areyoufuckingcoding.me'
    )
  end

  describe "#github_count" do
    it "returns number of github repo watcher" do
      subject.github_count.should > 0
    end
  end

  describe "#count" do
    it "returns number of github repo watchers when :github param specified" do
      subject.count(:github)[:github].should > 0
    end
  end
end
