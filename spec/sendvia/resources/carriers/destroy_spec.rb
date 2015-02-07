require 'spec_helper'

describe Sendvia::Carrier, "#destroy", vcr: "carriers/destroy" do
  let!(:session) { Sendvia::Session.new("OE7x-0ILBBpV0SJ-1N8HKDTWDDIvHeWs2DPGIn7Nem9R0-t0N0FHGv7vwxKcp1qEZOtCs7DufpJPAgWGCAfNQkA3jGFxCnDZbkMSuutFKSi3iJ7v1ewC8Ph-c12HPen0x2CXyRqXNLxIUHO3M6m1h5IJScMOfJQvd-sIRRUB9zolhwWCu4RtRMBF6SLIRNhwfmc0wCx1rGsE-i2aoYgkkVm-C_wrBXkDtKqqupsmzqp9I1kwGE305LxrNK8uzZSz", true) }
  let!(:existing_carrier) { Sendvia::Carrier.find('20f5f813-30b1-4433-ad2c-b8a46edf5e23') }
  subject { existing_carrier.destroy }

  it "should remove the carrier from the remote resource" do
    pending 'Again API response is method not allowed, DOCS say otherwise, will need to raise with sendvia'
    expect { Sendvia::Carrier.find('20f5f813-30b1-4433-ad2c-b8a46edf5e23') }.to raise_error { ActiveResource::ResourceNotFound }

    subject
  end

end
