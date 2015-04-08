require 'spec_helper'

describe Sendvia::Receipt, "#find", vcr: { cassette_name: 'receipts/find' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let(:receipt_id) { '6d0a3b9b-966e-4203-9fbc-e9be1d6a2c2b' }

  subject { Sendvia::Receipt.find receipt_id }

  it 'should return the receipt' do
    expect(subject.BookingId).to eq('7f54c9f5-63ba-415b-a53f-c929f48878ac')
  end
end
