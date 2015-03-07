require "spec_helper"

describe Sendvia::Base, "#clear_session!" do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let(:session) { Sendvia::Session.new(client_id, client_secret) }

  before { Sendvia::Base.activate_session session }

  subject { Sendvia::Base.clear_session! }

  it 'should clear the authorization header' do
    expect { subject }.to change { Sendvia::Base.headers['authorization'] }.to be_nil
  end
end
