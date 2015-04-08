require 'spec_helper'

describe Sendvia::Booking, "#find", vcr: { cassette_name: "bookings/find" } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let(:booking_id) { '7f54c9f5-63ba-415b-a53f-c929f48878ac' }

  subject { Sendvia::Booking.find booking_id }

  it 'should return a reciept' do
    expect(subject.BookingId).to eq(booking_id)
  end
end
