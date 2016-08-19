module SocialShares
  class Facebook < Base
    URL = 'http://graph.facebook.com/'

    def shares!
      response = RestClient.get(URL, {
        :params => {
          :id => checked_url
        }
      })
      JSON.parse(response).dig('share', 'share_count') || 0
    end
  end
end
