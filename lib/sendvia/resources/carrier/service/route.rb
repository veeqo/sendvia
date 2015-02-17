module Sendvia

  class Carrier::Service::Route < Base
    self.site = "#{REST_API_ENDPOINT}carriers/:carrier_id/services/:service_id"
  end
end
