module Sendvia

  class Session
    attr_accessor :access_token

    def initialize(access_token, activate_session = false)
      self.access_token = access_token
      Sendvia::Base.activate_session(self) if activate_session
    end
  end
end
