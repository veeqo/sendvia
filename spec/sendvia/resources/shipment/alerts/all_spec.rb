require 'spec_helper'

describe Sendvia::Shipment, "#alerts#all", vcr: { cassette_name: 'shipments/alerts' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let(:shipment) { Sendvia::Shipment.find 'e97c841a-2cdc-48be-b70d-1b8754181e3c' }

  subject { shipment.alerts }

  it 'should return a collection of alerts' do
    expect(subject.class).to eq(Array)
  end
end
