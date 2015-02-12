module Sendvia

  class Shipment < Base

    def label
      self.get(:label)
    end

    def self.labels shipment_ids
      get(:labels, ids: shipment_ids)
    end

    def alerts
      Alert.all(params: { shipment_id: self.id })
    end

    def create_alert options = {}
      Alert.create({ shipment_id: self.id }.merge! options)
    end
  end
end
