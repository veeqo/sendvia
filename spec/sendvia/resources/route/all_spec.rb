require 'spec_helper'

describe Sendvia::Carrier::Service::Route, "#all", vcr: { cassette_name: 'routes/all' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  subject { Sendvia::Carrier::Service::Route.all(params: { carrier_id: 'd5ec66cb-eb1d-476c-9e3d-44cf6738d154', service_id: '1f478ff2-15f6-4c13-9711-644fc26c362b' }) }

  it "should return a collection of routes" do
    expect(subject.class).to eq(ActiveResource::Collection)
  end
end
