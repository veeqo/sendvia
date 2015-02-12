require 'spec_helper'

describe Sendvia::Shipment, "#create", vcr: 'shipments/create' do
  let!(:session) { Sendvia::Session.new("QuxfpDRbKSUGGHVu2FPw-tHypV-ZGbYQ8Pitwmk1uCowXwXrmWV4rAiB2UXDajSVguJKMcC5llhVcJ-2bH0jKfJH-ufOY00aOUMBqCRAQpWLwkYuXcw1bybHQdoKqGfheKlEkj_9ysHbdPw4Zlzk-7-0X-Gz8pIsHIUDeU2fOGnsBAi555rUSgFwKrzCa95qzTJR65EQVpiyBVLu9GfbT-vyyVo8zgBAgC73y28KA5XtNdd2nfwbtQgICINwWfo0", true) }
  let!(:shipment_id) { SecureRandom.uuid }

  subject { Sendvia::Shipment.create example_shipment_hash(Id: shipment_id) }

  it 'should be success' do
    expect { subject }.to_not raise_error
  end
end
