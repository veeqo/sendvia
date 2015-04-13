require 'spec_helper'

describe Sendvia::Base, "#session" do
  let(:session) { Sendvia::Session.new('CLIENT_ID', 'CLIENT_SECRET', false) }

  context 'when session is assigned a value' do

    subject { Sendvia::Base.session = session }

    before { subject }

    it "allow session to be set" do
      expect(Sendvia::Base.session).to eq(session)
    end
  end

  context 'when session value is to be returned' do
    subject { Sendvia::Base.session }

    before { Sendvia::Base.session = session }

    it 'should return the correct session' do
      expect(subject).to eq(session)
    end
  end
end
