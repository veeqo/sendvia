require 'spec_helper'

describe Sendvia::Carrier, "#create" do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  subject { Sendvia::Carrier.create carrier_attributes }

  context 'when created with valid parameters', vcr: { cassette_name: "carriers/create_successful" } do
    let(:carrier_attributes) do
      {
        Id: SecureRandom.uuid,
        Name: 'MY NEW CARRIER',
        Private: false,
        Editable: true
      }
    end

    it 'should be successful' do
      expect { subject }.to_not raise_error
    end
  end

  context 'when created with invalid parameters', vcr: { cassette_name: "carriers/create_unsuccessful" } do
    let(:carrier_attributes) { { nonsense: 'true' } }

    it 'should not be successful' do
      expect { subject }.to raise_error { ActiveResource::BadRequest }
    end
  end
end
