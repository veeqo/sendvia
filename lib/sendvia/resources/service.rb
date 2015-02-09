module Sendvia

  class Carrier < Base

    class Service < Base
      self.site = "#{REST_API_ENDPOINT}carriers/:carrier_id/"
    end
  end
end
