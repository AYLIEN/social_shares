module SocialShares
  class Linkedin < Base
    URL = 'https://www.linkedin.com/countserv/count/share'

    def shares!
      response = get(URL, {
        params: {
          url: checked_url,
          format: 'json'
        }
      })

      JSON.parse(response)['count']
    end
  end
end
