def example_shipment_hash(options = {})
  {
    Id: SecureRandom.uuid,
    Sender: example_sender,
    Recipient: example_recipient,
    Parcels: example_parcels,
    Collection: DateTime.now.to_s,
    Insured: false,
  }.merge! options
end
