def example_parcels(options = {})
  [
    {
      Id: SecureRandom.uuid,
      Weight: Random.rand(1000),
      Size: example_dimensions,
      Value: 123.00,
      Currency: 826
    }.merge!(options)
  ]
end

def example_dimensions
  {
    Height: Random.rand(50),
    Length: Random.rand(50),
    Width: Random.rand(50),
  }
end
