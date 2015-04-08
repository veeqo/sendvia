require 'spec_helper'

describe Sendvia::Quote, "#find", vcr: { cassette_name: 'quotes/find' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  subject { Sendvia::Quote.find '60f59144-c76f-4640-9e0a-9b24c2e34892' }

  it "should return the quote query" do
    expect(subject.QueryId).to be_present
  end

  it 'should have the quote shipments' do
    expect(subject.QuoteShipments.map(&:Cost)).to be_present
  end
end
