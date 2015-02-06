require 'spec_helper'

describe Sendvia::Base, "activate_session" do
  let(:session) { Sendvia::Session.new("MY_TOKEN") }

  subject { Sendvia::Base.activate_session(session) }

  it 'should set the base site for REST API' do
    expect { subject }.to change { Sendvia::Base.site.to_s }.to('https://www.sendvia.co.uk/rest/alpha5/')
  end

  it 'should set the authorization header with the value of the access token' do
    expect(Sendvia::Base.headers['authorization']).to eq('Bearer MY_TOKEN')

    subject
  end
end
