def example_quote_hash(options = {})
  {
    Id: SecureRandom.uuid,
    Currency: 826,
    Shipments: [ example_shipment_hash ]
  }.merge! options
end
