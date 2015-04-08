require 'spec_helper'

describe Sendvia::Quote, "#create", vcr: { cassette_name: 'quotes/create' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let(:quote_details) { example_quote_hash }

  subject { Sendvia::Quote.create quote_details }

  it "should return the quote query" do
    expect(subject.QueryId).to be_present
  end

  it 'should have the quote shipments' do
    expect(subject.QuoteShipments.map(&:Cost)).to be_present
  end
end
