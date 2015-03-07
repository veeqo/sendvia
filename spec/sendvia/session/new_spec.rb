require 'spec_helper'

describe Sendvia::Session, "#new" do

  let(:client_id) { 'CLIENT_ID' }
  let(:client_secret) { 'CLIENT_SECRET' }
  let(:access_token) { 'P1TF-iMBXSgdDhCFtEDRRVdf-xRTatkXFiOLG0t2gMIIgyWY3B64bVQIILndkaNjN8cnj3XN7648khjcrpH4ZJvw-IeQVvwbkitm3YL9ItxnlZVIwNg8MNeORJ4yMIOJepyQNHOOjcu8jYPFuKedNuQI-ldcNkMWrltYK6inuFfx4DAC2IeP_XTf4Y7OspwC3JPwrrtNl1_TPsLWS4LxMecwwfnlMdh8VUmLjsxQ-O6Mnd1fzakYnGBSRLFnCh3f' }
  subject {
    VCR.use_cassette("Sendvia_Session/get_oauth_token") do
      Sendvia::Session.new(client_id, client_secret, activate_session)
    end
  }

  context 'when activate session is false'
    let(:activate_session) { false }

  it 'should not request a new access token and add it to the headers' do
    expect(subject.access_token).to be_nil
  end

  it 'should not call activate_session method on Sendvia::Base' do
    expect(Sendvia::Base).to_not receive(:activate_session)

    subject
  end

  context 'when activate session is true' do
    let(:activate_session) { true }

    it 'should add the access token to the headers' do
      expect(subject.access_token).to eq(access_token)
    end

    it 'should call activate_session method on Sendvia::Base' do
      expect(Sendvia::Base).to receive(:activate_session)

      subject
    end
  end
end
