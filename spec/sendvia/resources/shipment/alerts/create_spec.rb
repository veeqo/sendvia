require 'spec_helper'

describe Sendvia::Shipment, "#alerts", vcr: 'shipments/create_alert' do
  let!(:session) { Sendvia::Session.new("a_UhJg_6Uw-c6gs1xSXHdcE_joQJKOtW-iLU2nKH_IWkfZqrvtSBKVg-famJBmzZM8wr5C85LxFznV01iNH5N3nd0YJP6_KxDAPKjAaBYbyETIXsluPlQZmoEBfcvdxLlPTVVctpM_bhlW9GnoJCVJcggBwaqr9QsZJLvcXjUMull3W4Q4bSmxrdv4PIvz6HEM71edCws0S79OuvGECPRPgXvVmcEqyXIuURvFqiM04XwlBedK-hJazowb_LuM3u", true) }
  let(:shipment) { Sendvia::Shipment.find 'fa13db9f-1ee7-4d08-9e85-0cee3147cebc' }
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
