require 'spec_helper'

describe Sendvia::Parcel::Milestone, "#all", vcr: { cassette_name: 'parcels/milestones/all' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  subject { Sendvia::Parcel::Milestone.all(params: { parcel_id: 'e670dd8e-9141-43c2-a61e-f0cb17178a2b' }) }

  it "should create a milestone for the parcel" do
    expect(subject.class).to eq(Array)
  end
end
