require 'spec_helper'

describe Sendvia::Base, "activate_session" do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let(:access_token) { 'P1TF-iMBXSgdDhCFtEDRRVdf-xRTatkXFiOLG0t2gMIIgyWY3B64bVQIILndkaNjN8cnj3XN7648khjcrpH4ZJvw-IeQVvwbkitm3YL9ItxnlZVIwNg8MNeORJ4yMIOJepyQNHOOjcu8jYPFuKedNuQI-ldcNkMWrltYK6inuFfx4DAC2IeP_XTf4Y7OspwC3JPwrrtNl1_TPsLWS4LxMecwwfnlMdh8VUmLjsxQ-O6Mnd1fzakYnGBSRLFnCh3f' }
  let(:session) do
    Sendvia::Session.new(client_id, client_secret, false).tap do |session|
      session.access_token = access_token
    end
  end

  subject { Sendvia::Base.activate_session(session) }

  it 'should set the base site for REST API' do
    expect { subject }.to change { Sendvia::Base.site.to_s }.to('https://www.sendvia.co.uk/rest/beta/')
  end

  it 'should set the authorization header with the value of the access token' do
    expect(Sendvia::Base.headers['authorization']).to eq("Bearer #{access_token}")

    subject
  end
end
