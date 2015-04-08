require 'spec_helper'

describe Sendvia::Shipment, '#labels', vcr: { cassette_name: 'shipments/labels' } do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
  let(:pdf_reader) { PDF::Reader.new("labels.pdf") }

  subject { Sendvia::Shipment.labels(['e97c841a-2cdc-48be-b70d-1b8754181e3c']) }

  def write_to_file
    File.open('labels.pdf', 'wb') { |labels| labels.write subject }
  end

  after(:all) { File.delete('labels.pdf') }

  it 'should return valid pdf data that can be saved as a pdf' do
    pending 'Beta has broken compatibility for this'
    expect { write_to_file }.not_to raise_error
  end
end
