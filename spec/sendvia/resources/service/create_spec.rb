require "spec_helper"

describe Sendvia::Carrier::Service, "#create", vcr: { cassette_name: 'carrier_services/create' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let!(:carrier) { Sendvia::Carrier.find("307a87a9-6cf2-4ba6-a59f-099babc020d5") }
  let(:carrier_service_attributes) do
    {
      carrier_id: carrier.Id,
      Name: 'MY AWESOME NEW SERVICE',
      Private: false,
      Transport: 'Road',
      Tracked: true,
      Volumetric: false,
      PrintLabels: false,
      Description: 'My New Service for my carrier',
      Information: 'A wonderful revolutionary tracked service'
    }
  end
  subject { Sendvia::Carrier::Service.create carrier_service_attributes }

    it 'should be successful' do
      expect { subject }.to_not raise_error
    end

    it 'should create the service' do
      expect(subject.Name).to eq(carrier_service_attributes[:Name])
    end
end
