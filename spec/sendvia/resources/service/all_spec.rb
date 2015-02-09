require 'spec_helper'

describe Sendvia::Carrier::Service, '#all', vcr: 'carrier_services/all' do
  let!(:session) { Sendvia::Session.new("d_AZFVtWxHrssswxzVlPm76JoNvgqyh9chPavWs2cJW3b7sBYD2IdMDhXDvq4OUSs03weHkE3ojfKyXoGYRMeU4DgH_1AVksWGMS1_6qkJwRyjWbEo1n28uuoBWWtgg8tiLPsRI57s7-n5uIKub0ST665qtsvxQMw0_Aagf2Yw4mr5jG1tD1Wnz0RXSHOHPI-WVHcVkoXQPb5QaOWDpT-MqiRfKCkpw83XnRfjx2oqvKTl-oyH5p9kTS8HY0_XHG", true) }
  let!(:carrier) { Sendvia::Carrier.find("de306a53-25c5-48b6-a722-e71a38afbf95") }

  subject { carrier.services }

  it 'should return a relation of carrier services' do
    expect(subject.class).to eq(ActiveResource::Collection)
  end

  it 'should return valid carrier services' do
    expect(subject.map(&:Name)).to match_array(["Courier", "Parcelshop"])
  end
end 
