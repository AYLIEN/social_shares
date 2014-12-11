module SocialShares
  class Facebook < Base
    URL = 'https://graph.facebook.com/fql'

    def shares!
      response = RestClient.get(URL, {
        :params => {
          :q => "SELECT url, normalized_url, share_count,
            like_count, comment_count, total_count,commentsbox_count,
            comments_fbid, click_count
            FROM link_stat WHERE url='#{fql_escape(checked_url)}'"
        }
      })
      JSON.parse(response)['data'][0]['share_count'] || 0
    end

    private

    def fql_escape(str)
      str.gsub("'", "\\\\'")
    end
  end
end
