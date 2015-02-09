require "spec_helper"

describe Sendvia::Carrier::Service, "#create", vcr: 'carrier_services/create' do
  let!(:session) { Sendvia::Session.new("mX0do9pfLY23xINzIH45TKlQpQRjoBVi_SrxTf3YfVMUqpycJQYKuOY7W-6m1TC4_NCq2le7NjAcctbnaaqd32b4zQN_x6Fz0Viftv4ZbjKQUcSmkX_OvWDzezfISpsztTNscIjp-pjwNPBB2pEZpWLr7Dz-7t4foHJ1QR9I1Skn8AU2FcfgOFo7I1Vwar6V3E59abL6nKa78QHPFITjH52JFeB8biWLWDXtjuZ4xOyMvDhmlCoSvYmFkaLPeMKG", true) }
  let!(:carrier) { Sendvia::Carrier.find("cae6d11a-9fde-4f66-a141-01a86ea8b0ea") }
  let(:carrier_service_attributes) do
    {
      carrier_id: carrier.Id,
      Name: 'MY AWESOME NEW SERVICE',
      Private: false,
      Transport: 'Road',
      Tracked: true,
      Volumetric: false,
      PrintLabels: false,
      Description: 'My New Service for my carrier',
      Information: 'A wonderful revolutionary tracked service'
    }
  end
  subject { Sendvia::Carrier::Service.create carrier_service_attributes }

    it 'should be successful' do
      expect { subject }.to_not raise_error
    end

    it 'should create the service' do
      expect(subject.Name).to eq(carrier_service_attributes[:Name])
    end
end
