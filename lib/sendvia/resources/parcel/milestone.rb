module Sendvia

  class Parcel::Milestone < Base
    self.site = "#{REST_API_ENDPOINT}parcels/:parcel_id"
  end
end
