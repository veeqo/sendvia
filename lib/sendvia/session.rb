module Sendvia

  class Session < Base
    OAUTH_URL = "#{BASE_API_ENDPOINT}#{API_VERSION}"
    TOKEN_URL = 'token'
    AUTH_URL = 'account/authorize'

    schema do
      string 'access_token'
      timestamp 'expires_at'
    end

    def initialize(client_id, client_secret, activate_session = false)
      super(client_id: client_id, client_secret: client_secret, activate_session: activate_session, created_at: DateTime.now)
      setup_session if activate_session
    end

    def access_token
      setup_session if expired? && activate_session?
      super
    end

    private

    def setup_session
      load(get_token.to_hash)
      Sendvia::Base.activate_session(self)
    end

    def get_token
      client = OAuth2::Client.new(self.client_id,
                                  self.client_secret,
                                  site: OAUTH_URL,
                                  token_url: TOKEN_URL,
                                  authorize_url: AUTH_URL)
      client.client_credentials.get_token
    end

    def expired?
      DateTime.now > (created_at + expires_in_seconds)
    end

    def expires_in_seconds
      (expires_in * 1.day).seconds
    end

    def expires_in
      (Time.at(expires_at).to_datetime - created_at)
    end

    def expires_at
      super || Time.now.to_i
    end
  end
end
