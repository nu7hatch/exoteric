module Exoteric
  module Github
    def self.id
      :github
    end

    def github_url
      "https://api.github.com/repos/#{repo_name}"
    end
    
    def repo_name
      options[:github_repo]
    end
    
    def github_count
      res = RestClient.get(github_url)
      JSON.parse(res.to_str)['watchers_count'].to_i
    rescue
      0
    end
  end

  Counter << Github
end
