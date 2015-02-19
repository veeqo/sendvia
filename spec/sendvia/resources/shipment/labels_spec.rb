require 'spec_helper'

describe Sendvia::Shipment, '#labels', vcr: 'shipment/labels' do
  let!(:session) { Sendvia::Session.new("cpsamvqLFfaDGhWSq_G7dWk9QhtNcNZIjqRd94mQSTN3g_o-KIbwITJ_heR0hxWILtguaxhRPbzOAyeMxFE_wuXj09vdJh2zTqhCL2ymHov5P7e5dgu0854pOUge0HRWoW72WuzICjEBcGGiLDyU1PWIfw3YBe_iPIBCalSnbfHNeNEOKYSfOAW5KxmCa_FnxeStoj-i9opKZdY9RVNw_O1v4MuWyaq7yvmvUrWNYHEgQqIlFoLXrHt__QckjUUN", true) }
  let(:pdf_reader) { PDF::Reader.new("labels.pdf") }


  subject { Sendvia::Shipment.labels(['A4F1C0AF-EF7E-44B3-8771-2BC6FD270E6C', 'A4F1C0AF-EF7E-44B3-8771-2BC6FD270E6C']) }

  def write_to_file
    File.open('labels.pdf', 'wb') { |labels| labels.write subject }
  end

  after(:all) { File.delete('labels.pdf') }

  it 'should return valid pdf data that can be saved as a pdf' do
    expect { write_to_file }.not_to raise_error
  end

  it 'should produce the correct labels' do
    expect(pdf_reader.page(1).text).to include("70 William Street")
    expect(pdf_reader.page(2).text).to include("70 William Street")
  end
end
