module SocialShares
  class Base
    attr_accessor :checked_url

    def initialize(checked_url)
      @checked_url = checked_url
      
      if Configuration.config[:http_proxy]
        RestClient.proxy = Configuration.config[:http_proxy]
      end
    end

    def shares
      shares!
    rescue => e
      puts "[#{self.class.name}] Error during requesting sharings of '#{checked_url}': #{e}"
      nil
    end

    def shares!
      raise NotImplementedError
    end
  end
end
