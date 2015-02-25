require 'spec_helper'

describe Sendvia::Carrier::Service, "countries", vcr: 'services/countries' do
  let!(:session) { Sendvia::Session.new("ZDU3Y98sfE-F3hnPr4LcUgLkxfiPe6TKsl0YacnZAHVvuUWbLAdstwEwJ99CTIy4mS36j7tMANyol-g7-y40kOo3_RRa-IcO8Koz5EbJsXakNl59MOBIO85waS5P0ZAZu_UTNdPDm70_AbRCsSd1j5GxmYUrnReOdchLGQYZZmExk6JtPElU1tMjOiZLnCtKefj2PplQSz3_HV1eVRFYmBKJmhPXKXp-XWFhiA7P1haaUHvzQ9YfUqSmgdV4TA3b", true) }
  let!(:service) { Sendvia::Carrier::Service.find("b42a0b50-0393-43cf-9499-4fe90ec020f7", params: { carrier_id: "de306a53-25c5-48b6-a722-e71a38afbf95" }) }

  subject { service.countries }

  it 'should return country instances' do
    expect(subject.class).to eq(Array)
  end

  it 'should contain valid country objects' do
    expect(subject.map(&:Name)).to eq([])
  end
end
