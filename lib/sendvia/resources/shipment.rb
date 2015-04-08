module Sendvia

  class Shipment < Base

    def label
      Base64.decode64 get(:label)
    end

    def self.labels shipment_ids
      labels_response_body = post(:labels, {}, { shipmentIds: shipment_ids.to_s }).body
      Base64.decode64(ActiveSupport::JSON.decode(labels_response_body)["Data"])
    end

    def alerts
      Alert.all(params: { shipment_id: self.id })
    end

    def create_alert options = {}
      Alert.create({ shipment_id: self.id }.merge! options)
    end
  end
end
