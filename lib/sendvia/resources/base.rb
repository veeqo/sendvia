module Sendvia
  class Base < ActiveResource::Base
    class_attribute :include_format_in_path
    self.include_format_in_path = false
    self.include_root_in_json = false
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
      "?#{option_string}" unless options.nil? || options.empty?
    end
  end
end


