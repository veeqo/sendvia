require 'spec_helper'

describe Sendvia::Carrier, "#find", vcr: { cassette_name: '/carriers/find' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let(:carrier_id) { "c16d9f5a-55f0-4c9f-b8ae-9b23cc766423" }

  context 'when there are no additional parameters' do
    subject { Sendvia::Carrier.find(carrier_id) }

    it 'should return the chosen carrier' do
      expect(subject.Id).to eq(carrier_id)
    end

    it 'should have the carrier attributes' do
      expect(subject.attributes).to eq({"Id"=>"c16d9f5a-55f0-4c9f-b8ae-9b23cc766423", "Name"=>"MY NEW CARRIER", "Private"=>true, "Editable"=>true, "Services"=>nil})
    end
  end
end
