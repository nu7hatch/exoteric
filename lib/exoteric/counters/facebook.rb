module Exoteric
  module Facebook
    def self.id
      :facebook
    end

    def facebook_url
      "http://graph.facebook.com/?ids=#{url}"
    end

    def facebook_count
      res = RestClient.get(facebook_url)
      JSON.parse(res.to_str)[url]['shares'].to_i
    rescue
      0
    end
  end

  Counter << Facebook
end
