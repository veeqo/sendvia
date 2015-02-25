require 'spec_helper'

describe Sendvia::Country, "#all", vcr: 'countries/all' do
  let!(:session) { Sendvia::Session.new("NO5v9GcsdIomSfqfUwIVB2wJY1SB_HWHf9MKQzZ_8bMr25iTy9JUq3-upSSQue_dtPnZjjtUQKozsVcbw_406c86evm85Hx9H90k6lyZ_Q-A_OBXPOd5d_QQYbAPC_blr6jMys0xSitwW1JrwOw1AigMLxIjtZSfOX8-lyf2_0deuqWymiADdbtYrJRbwKBrgeRlxpdhMmN8x0UXN0-V6vrgbCKsKA918EcI5qidL7oTCeEbFP4aDZ8SK3pGBUxQ", true) }

  subject { Sendvia::Country.all }

  it 'should return country instances' do
    expect(subject.class).to eq(Array)
  end

  it 'should contain valid country properties' do
    expect(subject.map(&:Name)).to include "Afghanistan", "Albania", "Kyrgyzstan"
  end
end
