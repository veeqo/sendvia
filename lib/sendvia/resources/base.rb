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
    include Sendvia::Header

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
