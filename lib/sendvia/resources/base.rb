module Sendvia
  class Base < ActiveResource::Base
    BASE_API_ENDPOINT = 'https://www.sendvia.co.uk/'
    API_VERSION = 'beta'
    REST_API_ENDPOINT = "#{BASE_API_ENDPOINT}rest/#{API_VERSION}/"

    self.include_format_in_path = false
    self.include_root_in_json = false
    self.primary_key = :Id
    self.site = REST_API_ENDPOINT

    def self.activate_session session
      self.headers.merge! 'authorization' => "Bearer #{session.access_token}"
    end

    def self.clear_session!
      self.headers.delete('authorization')
    end

    def self.create_with_url_params(attributes = {}, params = {})
      self.new(attributes).tap do |resource|
        old_prefix_options = resource.prefix_options.dup
        resource.prefix_options = resource.prefix_options.merge(params)
        resource.save
        resource.prefix_options = old_prefix_options
      end
    end

    private

    def self.query_string(options)
      option_string = options.to_query.gsub(/\%5B/, "[").gsub(/\%5D/, "]")
      "?#{option_string}" if options.present?
    end
  end
end
