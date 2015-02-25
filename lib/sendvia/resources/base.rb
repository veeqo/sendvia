module Sendvia
  class Base < ActiveResource::Base
    class_attribute :include_format_in_path
    self.include_format_in_path = false
    self.primary_key = :Id

    REST_API_ENDPOINT = 'https://www.sendvia.co.uk/rest/alpha5/'

    include Sendvia::ElementPath
    include Sendvia::CollectionPath

    def self.activate_session session
      self.site = REST_API_ENDPOINT
      self.headers.merge! 'authorization' => "Bearer #{session.access_token}"  #TODO consider thread safety
    end

    def self.clear_session!
      self.headers.delete('authorization')
    end
  end
end
