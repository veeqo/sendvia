module ActiveResource

  class Base
    class_attribute :include_format_in_path

    def self.headers #Backported from https://github.com/rails/activeresource/commit/99cbab7381394ae58cc8ce28de44323b2fa14da1
      Thread.current["active.resource.headers.#{self.object_id}"] ||= {}

      if superclass != Object && superclass.headers
        Thread.current["active.resource.headers.#{self.object_id}"] = superclass.headers.merge(Thread.current["active.resource.headers.#{self.object_id}"])
      else
        Thread.current["active.resource.headers.#{self.object_id}"]
      end
    end

    def self.element_path(id, prefix_options = {}, query_options = nil)
      super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
    end

    def self.new_element_path(prefix_options = {})
      super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
    end

    def self.collection_path(prefix_options = {}, query_options = nil)
      super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
    end

    def self.singleton_path(prefix_options = {}, query_options = nil)
      super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
    end
  end
end
