require 'spec_helper'

describe Sendvia::Session, "#new", vcr: { cassette_name: 'session/new' } do

  let(:client_id) { 'CLIENT_ID' }
  let(:client_secret) { 'CLIENT_SECRET' }
  let(:access_token) { 'Y111_ALDC0FiEoAWwD2_4qy35wkP--_gWh4eG5hvPiwTf6QISwlKCZv0JLgXNjh5kWYSHAe9wQ5bLF8Cgx60JTjO8NZcuUk7uG5La1Ww0RGkg4YuQDKbRGbkNDPcnUQeDZ_PkwP58smhowTwIkyhS4eFPaVxbNItDocNIfRCc4t03TDFbcQBrUNEV9X5Q_ZGkBc7Er8Tcu1XpLFOpcfZ5LOoGgnVox7UcIykF0lHnAXGNUhkSGBHuSBKuLRcnkjO' }
  subject { Sendvia::Session.new(client_id, client_secret, activate_session) }

  context 'when activate session is false' do
    let(:activate_session) { false }

    it 'should not request a new access token and add it to the headers' do
      expect(subject.access_token).to be_nil
    end

    it 'should not call activate_session method on Sendvia::Base' do
      expect(Sendvia::Base).to_not receive(:activate_session)

      subject
    end
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
