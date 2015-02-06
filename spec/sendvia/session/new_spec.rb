require 'spec_helper'

describe Sendvia::Session, "#new" do

  let(:access_token) { "MY_TOKEN" }
  subject { Sendvia::Session.new(access_token, activate_session) }

  context 'when activate session is false'
    let(:activate_session) { false }

  it 'should add the access token to the headers' do
    expect(subject.access_token).to eq(access_token)
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
