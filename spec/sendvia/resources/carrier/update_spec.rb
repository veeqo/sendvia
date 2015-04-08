require 'spec_helper'

describe Sendvia::Carrier, "#update", vcr: { cassette_name: "carriers/update" } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let(:existing_carrier) { Sendvia::Carrier.find('c16d9f5a-55f0-4c9f-b8ae-9b23cc766423') }
  let(:updated_carrier_params) { { name: "My Updated Carrier" } }

  subject { Sendvia::Carrier.find('c16d9f5a-55f0-4c9f-b8ae-9b23cc766423').update_attributes updated_carrier_params }

  it 'should update the remote resource' do
    subject
    expect(Sendvia::Carrier.find("c16d9f5a-55f0-4c9f-b8ae-9b23cc766423").Name).to eq(updated_carrier_params[:name])
  end
end
