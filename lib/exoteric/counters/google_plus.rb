module Exoteric
  module GooglePlus
    def self.id
      :plusone
    end

    def plusone_url
      "https://clients6.google.com/rpc?key=AIzaSyCKSbrvQasunBoV16zDH9R33D88CeLr9gQ"
    end

    def plusone_count
      json = '[{"method":"pos.plusones.get","id":"p","params":{"nolog":true,"id":"' + url + '","source":"widget","userId":"@viewer","groupId":"@self"},"jsonrpc":"2.0","key":"p","apiVersion":"v1"}]'
      res = RestClient.post(plusone_url, json, :content_type => :json)
      JSON.parse(res.to_str)[0]['result']['metadata']['globalCounts']['count'].to_i
    end
  end

  Counter << GooglePlus
end
