require 'spec_helper'

describe Sendvia::Carrier, "#all", vcr: "carriers/all" do
  let!(:session) { Sendvia::Session.new("PBH2v6Qgukb3iXGW4xb-F68we8kiWcxtJwThYdyhME7vEihwWrequFVQYhQr0Jm1PAN3s_fTH43BOaGlU6kxFQ0NUl4R5EPUfYD5uCUIByJnYx6UmjDdOMaQrb-lgaOdDgHG94t72nO7QKmmv08IXLLQOh4ae2iiXTSMWDjn5jvWYhwIJ5k2PuaSfkJx4rHdDeXydFFlM2HXCRcrZCgYOWoLqsFJHbspUyUqbeb1DAjwsgkAeSbPgRS5qVQR6BPE", true) }

  context 'when services are not to be included' do
    subject { Sendvia::Carrier.all }

    it 'should return an instance of active resource collection' do
      expect(subject.class).to eq(Array)
    end

    it 'should return a list of carriers' do
      expect(subject.count).to eq(2)
    end

    it 'should have attributes of carriers' do
      expect(subject.map(&:Name)).to match_array (["Yodel", "MyHermes"])
    end
  end

  context 'when services are to be included' do
    subject { Sendvia::Carrier.all(:params => { :include => "services" }) }

    it 'should return an instance of active resource collection' do
      expect(subject.class).to eq(Array)
    end

    it 'should return a list of carriers' do
      expect(subject.count).to eq(2)
    end

    it 'should have attributes of carriers' do
      expect(subject.map(&:Name)).to match_array (["Yodel", "MyHermes"])
    end

    it 'should have attributes of services' do
      services = subject.flat_map(&:Services)
      expect(services.map(&:Name)).to match_array(["24", "48", "Courier", "Highland and Islands", "Highlands to Mainland", "Northern Ireland", "Northern Ireland to UK", "Parcelshop"])
    end
  end
end
