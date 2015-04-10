require 'spec_helper'

describe Sendvia::Session, "#access_token" do
  let(:client_id) { '24457b6f-7088-42af-8b0c-9e8326e0dba2' }
  let(:client_secret) { 'G3QFTOB0Y9JFAW36QHZV361T7Q75R3NW9XQO5H5DFKJTB2K254JD5Z8JC6HCQFJ4WXGNFOAJMVPTWHSFGF9WTK0JYHM992W9AP7OW7WQ3A0JJPW4OC6LGWLL66Y8CBJT8QTHKDTISS3STQ9IURU75L3NDVSZIYO11GK36PUKSX2X322P6POUQLYXWFDYV3A4EC1MFGME7JOITFUL3C32K3KPSXH0L5ZZX8T1BPK0DJWG6QDQV24TAHTK1L3R8V3' }

  subject { session.access_token }

  context 'when the session has not expired', vcr: { cassette_name: 'session/valid_session' } do
    let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }
    let(:access_token) { 'MY_UNCHANGED_TOKEN' }

    before { session.access_token = access_token }

    it 'should not request a new session' do
      expect(subject).to eq(access_token)
    end
  end

  context 'when the session is expired' do
    let!(:session) do
      VCR.use_cassette("session/expired_session") do
        Sendvia::Session.new(client_id, client_secret, true)
      end
    end
    let(:access_token) { 'SHOULD_CHANGE' }

    before do
      session.access_token = access_token
      allow_any_instance_of(Sendvia::Session).to receive(:created_at).and_return(2.days.ago.to_datetime, 30.minutes.ago.to_datetime)
      subject
    end

    it "should request a new session", vcr: { cassette_name: 'session/refresh_session' } do
      expect(subject).to_not eq(access_token)
    end
  end
end
