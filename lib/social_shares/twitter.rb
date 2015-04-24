module SocialShares
  class Twitter < Base
    URL = 'http://cdn.api.twitter.com/1/urls/count.json'

    def shares!
      check_url = strip_url(checked_url)
      response = RestClient.get(URL, {:params => {:url => check_url}})
      
      json_response = JSON.parse(response)
      
      if json_response['url'].downcase == check_url.downcase
        json_response['count']
      else
        0
      end
    end
    
    private
    
    def strip_url(url)
      uri = URI.parse(URI.encode(url.strip))

      if uri.query
        params = CGI::parse uri.query

        blacklist_params.each do |param|
          params.delete(param)
        end
        uri.query = params.empty? ? nil : params.to_query
      end

      uri.fragment = nil
      uri.path += '/' if (uri.path && uri.path[-1] != '/')

      uri.to_s
    end

    def blacklist_params
      ["utm_campaign", "utm_source", "utm_medium", "utm_content", "utm_term"]
    end
  end
end
