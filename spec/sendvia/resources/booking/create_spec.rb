require "spec_helper"

describe Sendvia::Booking, "#create", vcr: 'bookings/create' do
  let!(:session) { Sendvia::Session.new("Mptl-IDsMoEX5PP0O7gNaeyx5PLellWTVIjjbA3GIF3BCaNTvqSpowALqNKDiQuMmcflqojQVHL8Cie3Ql7bxP9a5YQBc_uUgrSoI1ZIVJvtXN2AyCZr6yk6hX-6jglpMMBWKytM7JD18K20K-1FyeQTEx8BIuVxwOJ5s4GOPSyU5abmcEZNxLHNmVZvckQltkeg9lDOMCegdZWkqeIredT07jBywhu3brHpo_HlQ82r-FJbFyqX4omyqYresi61", true) }
  let(:booking_options) do
    {
      Id: SecureRandom.uuid,
      Currency: 826,
      BookingShipments: booking_shipments
    }
  end

  let(:booking_shipments) do
    [
      example_booking_shipment
    ]
  end

  subject { Sendvia::Booking.create booking_options }

  it 'should have a booking id' do
    expect(subject.BookingId).to be_present
  end
end
