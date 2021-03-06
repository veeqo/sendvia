require 'spec_helper'

describe Sendvia::Carrier::Service::Route::Rate, "#all", vcr: { cassette_name: 'rate/all' } do
  let!(:session) { Sendvia::Session.new("xuHO0C5cn7g4zCWh2kWK7SMOtSZ3vvgpRKp8mMPQdHlXurAp-lauqtTpdSD3Y92o1ALVPdWtylRa43AXo-m5aFQYZ7-1jxwnhfqw3npn57pXAoYVDGp4k7j8jfBFc9BmV05ln-MLxZBc15Mg9311z0n-vMhdsKNgn03OtAx46uhIqcCSI2k-tBsHFSot8mdxZikV0nYuzWMWUuTMMuC2G4tBJUAqGoF7egYdofCFmZPT2VpDHCDjO1Dr6P_MvGhk", true) }

  subject do
    Sendvia::Carrier::Service::Route::Rate.all(params: {
      carrier_id: 'deb6893f-c2a5-4be0-a20a-4c0c28d2065f',
      service_id: '2657fa9b-2757-4826-9865-6610cf2bba41',
      route_id: '7a300f97-f160-4843-b0eb-81a5f7fbd6c0'
    })
  end


  it "should return a collection of rates" do
    pending 'Beta has no carriers available with routes to get rates from'
    expect(subject.class).to eq(ActiveResource::Collection)
  end

  it 'should contain correct rate information' do
    pending 'Beta has no carriers available with routes to get rates from'
    expect(subject.map(&:ItemRate)).to be_present
  end
end
