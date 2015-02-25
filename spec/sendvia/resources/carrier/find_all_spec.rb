require 'spec_helper'

describe Sendvia::Carrier, "#all" do
  let(:client_id) { "CLIENT_ID" }
  let(:client_secret) { "CLIENT_SECRET" }
  let!(:session) { Sendvia::Session.new(client_id, client_secret, true) }

  context 'when services are not to be included', vcr: { cassette_name: "carriers/all_without_services" } do
    subject { Sendvia::Carrier.all }

    it 'should return an instance of active resource collection' do
      expect(subject.class).to eq(Array)
    end

    it 'should return a list of carriers' do
      expect(subject.count).to eq(6)
    end

    it 'should have attributes of carriers' do
      expect(subject.map(&:Name)).to match_array (["MY NEW CARRIER", "MY NEW CARRIER", "MY NEW CARRIER", "MY NEW CARRIER", "My Updated Carrier", "UPS Veeqo"])
    end
  end

  context 'when services are to be included', vcr: { cassette_name: "carriers/all_with_services" } do
    subject { Sendvia::Carrier.all(:params => { :include => "services" }) }

    it 'should return an instance of active resource collection' do
      expect(subject.class).to eq(Array)
    end

    it 'should return a list of carriers' do
      expect(subject.count).to eq(6)
    end

    it 'should have attributes of carriers' do
      expect(subject.map(&:Name)).to match_array (["MY NEW CARRIER", "MY NEW CARRIER", "MY NEW CARRIER", "MY NEW CARRIER", "My Updated Carrier", "UPS Veeqo"])
    end

    it 'should have attributes of services' do
      services = subject.flat_map(&:Services)
      expect(services.map(&:Name)).to match_array(["Express", "Express Plus", "Express Saver", "Standard"])
    end
  end
end
