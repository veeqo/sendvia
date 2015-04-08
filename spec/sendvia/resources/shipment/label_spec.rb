require 'spec_helper'

describe Sendvia::Shipment, "#label", vcr: { cassette_name: 'shipments/label' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let(:shipment) { Sendvia::Shipment.find 'e97c841a-2cdc-48be-b70d-1b8754181e3c' }
  let(:pdf_reader) { PDF::Reader.new("label.pdf") }

  subject { shipment.label }

  def write_to_file
    File.open('label.pdf', 'wb') { |label| label.write subject }
  end

  after(:all) { File.delete('label.pdf') }

  it 'should return valid pdf data that can be saved as a pdf' do
    expect { write_to_file }.not_to raise_error
  end
end
