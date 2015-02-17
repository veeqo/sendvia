module Sendvia

  class Carrier::Service::Route::Rate < Base
    self.site = "#{REST_API_ENDPOINT}carriers/:carrier_id/services/:service_id/routes/:route_id"
  end
end
