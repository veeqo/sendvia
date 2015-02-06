module Sendvia
  class Base < ActiveResource::Base
    self.include_format_in_path = false
    REST_API_ENDPOINT = 'https://www.sendvia.co.uk/rest/alpha5/'

    def self.activate_session session
      self.site = REST_API_ENDPOINT
      self.headers.merge! 'authorization' => "Bearer #{session.access_token}"  #TODO consider thread safety
    end

    def self.clear_session!
      self.headers.delete('authorization')
    end
  end
end
