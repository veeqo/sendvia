require 'spec_helper'

describe Sendvia::Base, "#headers" do

  subject { Sendvia::Base.headers }

  before do
    Sendvia::Base.headers.delete('authorization')
    Sendvia::Base.headers['test'] = 1
  end

  after { Sendvia::Base.headers.delete('test') }

  context 'when there is no session set for the class' do

    before { Sendvia::Base.session = nil }

    it "should return headers without the authorization property" do
      expect(subject).to_not include "authorization"
      expect(subject).to include "test"
    end
  end

  context 'when session is present on the class' do
    let(:session) { Sendvia::Session.new('CLIENT_ID', 'CLIENT_SECRET') }

    before { Sendvia::Base.session = session }

    it 'should include the authorization header' do
      expect(subject).to include "authorization"
    end

    it 'should include other header properties previously set' do
      expect(subject).to include "test"
    end
  end
end
