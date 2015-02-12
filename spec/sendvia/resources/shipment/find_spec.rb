require 'spec_helper'

describe Sendvia::Shipment, "#find", vcr: 'shipments/find' do
  let!(:session) { Sendvia::Session.new("wgtkZTNkXCKzJwFTqSrSKXL4ba4PVZWnm4dbLtogos-9_zIDw-12guEH_jrfHz9Skd6W8WTPet61P3_CNS-bqonrgkUMWU-ZPczuf8hdNWLJ0TQchJcn6L8hU5i69ObTP04JSkDm5xlK-6tSICc6-DVf7F1I_kT1_FreUkqklXnMGoxfTwYOWZBgoGVWPMRAGdj3jkzDIM_HvZCZAyA2BIhKz__XIURqCi0awAfWUSEFaYrLXbFGq6r2D5P3CYuI", true) }

  subject { Sendvia::Shipment.find 'fa13db9f-1ee7-4d08-9e85-0cee3147cebc' }

  it 'should retuen an instance of Shipment' do
    expect(subject.class).to eq(Sendvia::Shipment)
  end

  it 'should contain shipment information' do
    expect(subject.id).to eq('fa13db9f-1ee7-4d08-9e85-0cee3147cebc')
  end

  it 'should contain the correct sender address' do
    expect(subject.Sender.Address.Company).to eq('A1A')
  end
end
