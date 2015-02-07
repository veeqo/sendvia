require 'spec_helper'

describe Sendvia::Carrier, "#update", vcr: "carriers/update" do
  let!(:session) { Sendvia::Session.new("OE7x-0ILBBpV0SJ-1N8HKDTWDDIvHeWs2DPGIn7Nem9R0-t0N0FHGv7vwxKcp1qEZOtCs7DufpJPAgWGCAfNQkA3jGFxCnDZbkMSuutFKSi3iJ7v1ewC8Ph-c12HPen0x2CXyRqXNLxIUHO3M6m1h5IJScMOfJQvd-sIRRUB9zolhwWCu4RtRMBF6SLIRNhwfmc0wCx1rGsE-i2aoYgkkVm-C_wrBXkDtKqqupsmzqp9I1kwGE305LxrNK8uzZSz", true) }
  let(:existing_carrier) { Sendvia::Carrier.find('20f5f813-30b1-4433-ad2c-b8a46edf5e23') }
  let(:updated_carrier_params) { { name: "My Updated Carrier" } }

  subject { Sendvia::Carrier.find('cae6d11a-9fde-4f66-a141-01a86ea8b0ea').update_attributes updated_carrier_params }

  it 'should update the remote resource' do
    pending "Sendvia are returning 405 error(Not Allowed), however docs say update is possible"
    subject
    expect(Sendvia::Carrier.find("cae6d11a-9fde-4f66-a141-01a86ea8b0ea").Name).to eq(updated_carrier_params[:name])
  end
end
