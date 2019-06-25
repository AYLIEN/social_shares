module SocialShares
  class Facebook < Base
    URL = 'http://graph.facebook.com/v3.3/'

    def shares!
      response = get(URL, params: {
        id: checked_url,
        fields: 'engagement'
      })
      json_response = JSON.parse(response)

      if json_response['share']
        json_response['engagement']['share_count'] || 0
      else
        0
      end
    end
  end
end
