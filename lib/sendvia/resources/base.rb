module Sendvia
  class Base < ActiveResource::Base
    class_attribute :include_format_in_path
    self.include_format_in_path = false
    self.primary_key = :Id

    REST_API_ENDPOINT = 'https://www.sendvia.co.uk/rest/alpha5/'

    include Sendvia::ElementPath
    include Sendvia::CollectionPath
    include Sendvia::Header

    def self.activate_session session
      self.site = REST_API_ENDPOINT
      self.headers.merge! 'authorization' => "Bearer #{session.access_token}"
    end

    def self.clear_session!
      self.headers.delete('authorization')
    end

    def self.primary_key  #Backported from https://github.com/rails/activeresource/commit/265007e6148aa70f1f94a73f2f3cdcb8987b205a
      if defined?(@primary_key)
        @primary_key
      elsif superclass != Object && superclass.primary_key
        primary_key = superclass.primary_key
      return primary_key if primary_key.is_a?(Symbol)
        primary_key.dup.freeze
      else
        'id'
      end
    end
  end
end
