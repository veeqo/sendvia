require 'spec_helper'

describe Sendvia::Booking, "#find", vcr: "bookings/find" do
  let!(:session) { Sendvia::Session.new("pqoxPRTKrjs8G1i_hlyrpTcdl2DTIorMPdsL4_iHFI6q8Y2vNmbU5E34OC3tVM5whEIeRCm_RPNliFhAme1hVGtssYhMVHQtYEgmsUBpGQS7vm4ACoTR08Mlu8pj5Nxv3ee4n8xZilcPFi_YtgV3W-DvXEh86nFmSMBSkJ0elHQeugv7I6YOhqrfdHaS9DOwVJwz_UfYozEDhfY16mPNkfPDZw4MK8R3-udQJBlR2uptvIgdbPvNd5nYGEKHlgNk", true) }

  subject { Sendvia::Booking.find "cdae84a1-7881-45c1-80e4-ba9545be5a85" }

  it 'should return a reciept' do
    expect(subject.BookingId).to eq("cdae84a1-7881-45c1-80e4-ba9545be5a85")
  end
end
