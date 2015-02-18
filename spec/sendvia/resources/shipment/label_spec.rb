require 'spec_helper'

describe Sendvia::Shipment, "#label", vcr: 'shipments/label' do
  let!(:session) { Sendvia::Session.new("mNRXXrLo4hY2NaFt5lFv2vA8S7qfEapIlrAGDPVeWLroG_LA7yzdQYa0Z-NJBLqT5LKVWRGoLOVcX3LBXN3p9hP32kKbb9edobQnJctmic6lyOKG7Vp801SK8JWLbhKDF3D0mTph4ftzJiN9IaSWoeQ0OD95su4HxxN7rSDwVYnD8EWqk0CXFtJ0o-cKhGPV7lycKuUSqi5iVJMFCfWcnErO5SWSZTcBYhOEIDg8zkr5cn6kfy4My7ROXV4kID9H", true) }
  let(:shipment) { Sendvia::Shipment.find 'A4F1C0AF-EF7E-44B3-8771-2BC6FD270E6C' }
  let(:pdf_reader) { PDF::Reader.new("label.pdf") }

  subject { shipment.label }

  after(:all) do

  end

  def write_to_file
    File.open('label.pdf', 'wb') { |label| label.write subject }
  end

  after(:all) { File.delete('label.pdf') }

  it 'should return valid pdf data that can be saved as a pdf' do
    expect { write_to_file }.not_to raise_error
  end

  it 'should produce the correct label' do
    expect(pdf_reader.page(1).text).to include("70 William Street")
  end
end
