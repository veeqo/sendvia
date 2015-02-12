require 'spec_helper'

describe Sendvia::Shipment, "#label", vcr: 'shipments/label' do
  let!(:session) { Sendvia::Session.new("QuxfpDRbKSUGGHVu2FPw-tHypV-ZGbYQ8Pitwmk1uCowXwXrmWV4rAiB2UXDajSVguJKMcC5llhVcJ-2bH0jKfJH-ufOY00aOUMBqCRAQpWLwkYuXcw1bybHQdoKqGfheKlEkj_9ysHbdPw4Zlzk-7-0X-Gz8pIsHIUDeU2fOGnsBAi555rUSgFwKrzCa95qzTJR65EQVpiyBVLu9GfbT-vyyVo8zgBAgC73y28KA5XtNdd2nfwbtQgICINwWfo0", true) }
  let(:shipment) { Sendvia::Shipment.find 'fa13db9f-1ee7-4d08-9e85-0cee3147cebc' }

  subject { shipment.label }

  it 'should return pdf' do
    pending 'There are no current available services that have a label to get, need to contact SendVia about this'
    raise #To allow spec to be pending
  end
end
