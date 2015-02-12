require 'spec_helper'

describe Sendvia::Receipt, "#find", vcr: 'sendvia/receipts/find' do
  let!(:session) { Sendvia::Session.new("yvqH_sQP_sjGQZASDxzb5A0JhBvBcpeKM9LKGckNKCCNtPtPUCm4FNhq3ELEz0n9Q4--AWSpf2NUWCrsGJZYnDnlODpC5TiD96bzG23TGOmOsUULQY9Ec_MTWTQmONfquH85zswVycrUtaS94J4p_5Ipv7lPM1n-VO1DRUSvcZEISmxAP35uOizt8zcqjlOEuOAqnNaAlKszQShfHNOL8ol-fzoK4AktGG2JvrQPsDjPwCH2dOqdh5RWJOIipnDR", true) }
  let(:receipt_id) { 'f74d12c0-7135-4cf6-8f33-8d99127e7ce3' }

  subject { Sendvia::Receipt.find 'f74d12c0-7135-4cf6-8f33-8d99127e7ce3' }

  it 'should return the receipt' do
    expect(subject.BookingId).to eq('cdae84a1-7881-45c1-80e4-ba9545be5a85')
  end
end
