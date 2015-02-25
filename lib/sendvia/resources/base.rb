module Sendvia
  class Base < ActiveResource::Base
    BASE_API_ENDPOINT = 'https://www.sendvia.co.uk/'
    API_VERSION = 'beta'
    REST_API_ENDPOINT = "#{BASE_API_ENDPOINT}rest/#{API_VERSION}/"

    class_attribute :include_format_in_path
    self.include_format_in_path = false
    self.include_root_in_json = false
    self.primary_key = :Id
    self.site = REST_API_ENDPOINT

    include Sendvia::ElementPath
    include Sendvia::CollectionPath

    def self.activate_session session
      self.session = session
    end

    def self.clear_session!
      self.session = nil
    end

    def self.create_with_url_params(attributes = {}, params = {})
      self.new(attributes).tap do |resource|
        old_prefix_options = resource.prefix_options.dup
        resource.prefix_options = resource.prefix_options.merge(params)
        resource.save
        resource.prefix_options = old_prefix_options
      end
    end

    def self.headers
      super.delete('authorization')
      super.merge! 'authorization' => "Bearer #{session.access_token}" if session.present?
      super
    end

    def self.session=(session)
      Thread.current["active.resource.session.#{self.object_id}"] = session
    end

    def self.session
      Thread.current["active.resource.session.#{self.object_id}"]
    end

    private

    def self.query_string(options)
      option_string = options.to_query.gsub(/\%5B/, "[").gsub(/\%5D/, "]")
      "?#{option_string}" if options.present?
    end
  end
end
