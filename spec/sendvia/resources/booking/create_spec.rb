require "spec_helper"

describe Sendvia::Booking, "#create", vcr: { cassette_name: 'bookings/create' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  let(:booking_options) do
    {
      Id: SecureRandom.uuid,
      Currency: 826,
      BookingShipments: booking_shipments,
      PaymentMethod: 'AccountCredit',
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
