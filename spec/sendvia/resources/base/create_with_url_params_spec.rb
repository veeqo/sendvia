require 'spec_helper'

describe Sendvia::Base, "#create_with_url_params", vcr: { cassette_name: 'base/create_with_url_params' } do
let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  let(:carrier_attributes) do
    {
      Id: 'TYGHGHGYHHJ565757657',
      Name: 'MY NEW CARRIER',
      Private: false,
      Editable: true
    }
  end

  subject { Sendvia::Carrier.create_with_url_params(carrier_attributes, {}) }

  it 'should be successful' do
    expect { subject }.to_not raise_error
  end
end
