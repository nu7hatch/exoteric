module Exoteric
  module Twitter
    def self.id
      :twitter
    end

    def twitter_url
      "http://urls.api.twitter.com/1/urls/count.json?url=#{url}"
    end

    def twitter_count
      res = RestClient.get(twitter_url)
      JSON.parse(res.to_str)['count'].to_i
    rescue
      0
    end
  end

  Counter << Twitter
end
