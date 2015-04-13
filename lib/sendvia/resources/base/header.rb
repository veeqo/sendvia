module Sendvia
  module Header
    extend ActiveSupport::Concern

    module ClassMethods
      def headers
        base_headers.delete('authorization')
        base_headers.merge! 'authorization' => "Bearer #{session.access_token}" if session.present?
        base_headers
      end

      def base_headers  #Backported partly from https://github.com/rails/activeresource/commit/99cbab7381394ae58cc8ce28de44323b2fa14da1
        Thread.current["active.resource.headers.#{self.object_id}"] ||= {}

        if superclass != Object && superclass.headers
          Thread.current["active.resource.headers.#{self.object_id}"] = superclass.headers.merge(Thread.current["active.resource.headers.#{self.object_id}"])
        else
          Thread.current["active.resource.headers.#{self.object_id}"]
        end
      end
    end
  end
end
