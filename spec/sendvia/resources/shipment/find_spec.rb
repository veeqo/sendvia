require 'spec_helper'

describe Sendvia::Shipment, "#find", vcr: 'shipments/find' do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  subject { Sendvia::Shipment.find 'e97c841a-2cdc-48be-b70d-1b8754181e3c' }

  it 'should retuen an instance of Shipment' do
    expect(subject.class).to eq(Sendvia::Shipment)
  end

  it 'should contain shipment information' do
    expect(subject.id).to eq('e97c841a-2cdc-48be-b70d-1b8754181e3c')
  end

  it 'should contain the correct sender address' do
    expect(subject.Sender.Address.Company).to eq('A1A')
  end
end
