require 'spec_helper'

describe Sendvia::Quote, "#create", vcr: 'quotes/create' do
  let!(:session) { Sendvia::Session.new("LUwOjhTAneKfmEYqUoBKeuk36c7Qg4HzDuwQuh20Ho7CVnrJ2c2C-tc_XNmPBdrmts934e_RKTPcJ9pVuvzPGLUsBthP_A7eiJhb6u4I89oGznXUDKDCeLKJ_HzKXzcv-jN4s9bSvt8nCdiMqHgFZGuIKB-Cu3A_DYJUFMvIRYBzYHR3IINRYMYO9z33PSPiLhsOf_SO7P-lZ33Eya_qthm0LprHKpm9cQwOduy0I6aVpvRxEIvOca--3VQhHc4x", true) }
  let(:quote_details) { example_quote_hash }

  subject { Sendvia::Quote.create quote_details }


  it "should return the quote query" do
    expect(subject.QueryId).to be_present
  end

  it 'should have the quote shipments' do
    expect(subject.QuoteShipments.map(&:Cost)).to be_present
  end
end
