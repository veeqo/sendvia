module Sendvia
  module CollectionPath
    extend ActiveSupport::Concern

    def custom_method_element_url(method_name, options = {})
      super.gsub(".#{self.class.format.extension}", "") unless self.include_format_in_path
    end

    module ClassMethods
      def collection_path(prefix_options = {}, query_options = nil)
        super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
      end

      def singleton_path(prefix_options = {}, query_options = nil)
        super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
      end

      def custom_method_collection_url(method_name, options = {})
        super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
      end

      def custom_method_new_element_url(method_name, options = {})
        super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
      end
    end
  end
end
