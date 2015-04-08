require 'spec_helper'

describe Sendvia::Carrier, "#destroy", vcr: { cassette_name: "carriers/destroy" } do
  let!(:session) { Sendvia::Session.new("OE7x-0ILBBpV0SJ-1N8HKDTWDDIvHeWs2DPGIn7Nem9R0-t0N0FHGv7vwxKcp1qEZOtCs7DufpJPAgWGCAfNQkA3jGFxCnDZbkMSuutFKSi3iJ7v1ewC8Ph-c12HPen0x2CXyRqXNLxIUHO3M6m1h5IJScMOfJQvd-sIRRUB9zolhwWCu4RtRMBF6SLIRNhwfmc0wCx1rGsE-i2aoYgkkVm-C_wrBXkDtKqqupsmzqp9I1kwGE305LxrNK8uzZSz", true) }
  let!(:existing_carrier) { Sendvia::Carrier.find('c16d9f5a-55f0-4c9f-b8ae-9b23cc766423') }
  subject { existing_carrier.destroy }

  it "should remove the carrier from the remote resource" do
    subject
    expect { Sendvia::Carrier.find('c16d9f5a-55f0-4c9f-b8ae-9b23cc766423') }.to raise_error { ActiveResource::ResourceNotFound }
  end
end
