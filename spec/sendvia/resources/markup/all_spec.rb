require 'spec_helper'

describe Sendvia::Markup, "#all", vcr: { cassette_name: 'markup/all' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  subject { Sendvia::Markup.all }

  it "should return a collection a markups" do
    expect(subject.class).to eq(ActiveResource::Collection)
  end
end
