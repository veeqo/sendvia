require 'spec_helper'

describe Sendvia::Carrier::Service, "countries", vcr: { cassette_name: 'carrier_services/countries' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let!(:service) { Sendvia::Carrier::Service.find("1f478ff2-15f6-4c13-9711-644fc26c362b", params: { carrier_id: "1f478ff2-15f6-4c13-9711-644fc26c362b" }) }

  subject { service.countries }

  it 'should return country instances' do
    expect(subject.class).to eq(Array)
  end

  it 'should contain valid country objects' do
    expect(subject.map(&:Name)).to eq([])
  end
end
