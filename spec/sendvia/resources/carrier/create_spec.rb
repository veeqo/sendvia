require 'spec_helper'

describe Sendvia::Carrier, "#create", vcr: "carriers/create" do
  let!(:session) { Sendvia::Session.new("OE7x-0ILBBpV0SJ-1N8HKDTWDDIvHeWs2DPGIn7Nem9R0-t0N0FHGv7vwxKcp1qEZOtCs7DufpJPAgWGCAfNQkA3jGFxCnDZbkMSuutFKSi3iJ7v1ewC8Ph-c12HPen0x2CXyRqXNLxIUHO3M6m1h5IJScMOfJQvd-sIRRUB9zolhwWCu4RtRMBF6SLIRNhwfmc0wCx1rGsE-i2aoYgkkVm-C_wrBXkDtKqqupsmzqp9I1kwGE305LxrNK8uzZSz", true) }

  subject { Sendvia::Carrier.create carrier_attributes }

  context 'when created with valid parameters' do
    let(:carrier_attributes) do
      {
        Id: 'TYGHGHGYHHJ565757657',
        Name: 'MY NEW CARRIER',
        Private: false,
        Editable: true
      }
    end

    it 'should be successful' do
      expect { subject }.to_not raise_error
    end
  end

  context 'when created with invalid parameters' do
    let(:carrier_attributes) { { nonsense: 'true' } }

    it 'should not be successful' do
      expect { subject }.to raise_error { ActiveResource::BadRequest }
    end
  end
end
