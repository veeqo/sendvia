require 'spec_helper'

describe Sendvia::Carrier, "#find", vcr: '/carriers/find' do
  let!(:session) { Sendvia::Session.new("hufaVakyrZ2z9N0NLOe5cxHfM-aHgM2Wt4QGk2FOOm3FchYCzhXBgkOFV29nY9H7TDMsSCdswu0144cN64G1KQ7F8Nwk3gczaihKQDYGZ9KHvT3cGzGnDWI8zCSQ3y-gCR87LpwDsBrR24YlQKXUmpBKYAlbeIJDp-R0nWa7Elp8ce_z65WViUBa9AUT-qWWIJz5tGtCFFgl2Qys2ILWEAI_vybSbUSriQmU1wAPu45zKDL3_3rRvr-GRlEMq2OO", true) }
  let(:carrier_id) { "deb6893f-c2a5-4be0-a20a-4c0c28d2065f" }

  context 'when there are no additional parameters' do
    subject { Sendvia::Carrier.find(carrier_id) }

    it 'should return the chosen carrier' do
      expect(subject.Id).to eq(carrier_id)
    end

    it 'should have the carrier attributes' do
      expect(subject.attributes).to eq({"Id"=>"deb6893f-c2a5-4be0-a20a-4c0c28d2065f", "Name"=>"Yodel", "Private"=>false, "Editable"=>false, "Services"=>nil})
    end
  end
end
