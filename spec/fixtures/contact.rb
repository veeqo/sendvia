def example_sender(options = {})
  example_contact options
end

def example_recipient(options = {})
  example_contact options
end

def example_contact(options = {})
  {
    Id: SecureRandom.uuid,
    Address: example_address,
    FirstName: "Werner",
    Surname: "Heisenberg",
    PhoneNumber: "12323-121211",
    MobileNumber: "12323-23232",
    Email: "ww@a1a.com"
  }.merge! options
end

def example_address(options = {})
  {
    Id: SecureRandom.uuid,
    Company: "A1A",
    Department: "Distributing",
    Floor: "Basement",
    StreetNumber: "1",
    Country: "GB",
    CountryIso: 826,
    City: 'Albuquerque',
    PostalArea: 'SA1 1DP'
  }.merge! options
end
