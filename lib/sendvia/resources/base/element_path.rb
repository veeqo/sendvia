module Sendvia
  module ElementPath
    extend ActiveSupport::Concern

    module ClassMethods
      def element_path(id, prefix_options = {}, query_options = nil)
        super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
      end

      def new_element_path(prefix_options = {})
        super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
      end

      def singleton_path(prefix_options = {}, query_options = nil)
        super.gsub(".#{self.format.extension}", "") unless self.include_format_in_path
      end
    end
  end
end
