require 'spec_helper'

describe Sendvia::Country, "#all", vcr: { cassette_name: 'countries/all' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  subject { Sendvia::Country.all }

  it 'should return country instances' do
    expect(subject.class).to eq(Array)
  end

  it 'should contain valid country properties' do
    expect(subject.map(&:Name)).to include "Afghanistan", "Albania", "Kyrgyzstan"
  end
end
