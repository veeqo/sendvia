require 'spec_helper'

describe Sendvia::Shipment, "#alerts", vcr: { cassette_name: 'shipments/create_alert' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let(:shipment) { Sendvia::Shipment.find 'e97c841a-2cdc-48be-b70d-1b8754181e3c' }
  let(:alert_params) do
    {
      Id: SecureRandom.uuid,
      Type: "Update",
      Date: DateTime.now.to_s,
      Message: "Creating an alert"
    }
  end

  subject { shipment.create_alert alert_params }

  it 'should be success' do
    expect { subject.class }.to_not raise_error
  end

  it 'should have attributes of created alert' do
    expect(subject.Message).to eq(alert_params[:Message])
  end
end
