module Sendvia

  class Carrier < Base

    class Service < Base
      self.site = "#{REST_API_ENDPOINT}carriers/:carrier_id/"

      def countries
        Sendvia::Country.all(params: { serviceId: self.Id })
      end
    end
  end
end
