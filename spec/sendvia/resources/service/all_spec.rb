require 'spec_helper'

describe Sendvia::Carrier::Service, '#all', vcr: { cassette_name: 'carrier_services/all' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let!(:carrier) { Sendvia::Carrier.find("d5ec66cb-eb1d-476c-9e3d-44cf6738d154") }

  subject { carrier.services }

  it 'should return a relation of carrier services' do
    expect(subject.class).to eq(ActiveResource::Collection)
  end

  it 'should return valid carrier services' do
    expect(subject.map(&:Name)).to match_array(["Express", "Express Plus", "Express Saver", "Standard"])
  end
end 
