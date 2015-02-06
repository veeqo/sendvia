require "spec_helper"

describe Sendvia::Base, "#clear_session!" do
  let(:session) { Sendvia::Session.new("MY_TOKEN") }

  before { Sendvia::Base.activate_session session }

  subject { Sendvia::Base.clear_session! }

  it 'should clear the authorization header' do
    expect { subject }.to change { Sendvia::Base.headers['authorization'] }.to be_nil
  end
end
