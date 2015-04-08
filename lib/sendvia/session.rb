module Sendvia

  class Session < Base
    OAUTH_URL = "#{BASE_API_ENDPOINT}#{API_VERSION}"
    TOKEN_URL = 'token'
    AUTH_URL = 'account/authorize'

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
                                  site: OAUTH_URL,
                                  token_url: TOKEN_URL,
                                  authorize_url: AUTH_URL)
      client.client_credentials.get_token.token
    end
  end
end
