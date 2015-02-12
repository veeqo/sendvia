module Sendvia

  class Shipment::Alert < Base
    self.site = "#{REST_API_ENDPOINT}shipments/:shipment_id"
  end
end
