require 'oauth2'

module Sendvia

  class Session
    SITE = 'https://www.sendvia.co.uk'
    TOKEN_URL = '/alpha5/token'
    AUTH_URL = '/alpha5/account/authorize'

    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :access_token

    def initialize(client_id, client_secret, activate_session = false)
      self.client_id = client_id
      self.client_secret = client_secret
      setup_session if activate_session
    end

    private

    def setup_session
      self.access_token = get_token
      Sendvia::Base.activate_session(self)
    end

    def get_token
      client = OAuth2::Client.new(self.client_id,
                                  self.client_secret,
                                  site: SITE,
                                  token_url: TOKEN_URL,
                                  authorize_url: AUTH_URL)
      client.client_credentials.get_token.token
    end
  end
end
