require 'spec_helper'

describe Sendvia::Shipment, "#alerts#all", vcr: 'shipments/alerts' do
  let!(:session) { Sendvia::Session.new("SCqf0zo9uRnWeSL46UnUo6xTRjXifdluS3yIf6ugI0b0GeokYMiKDng0vbkJtwZMGnWthTNjx_gtTIbPqm0i-s_Hf8JZSvizxlFyAW_CkLEHmL63e830U_b0byeYQh8FCa-04uE5cKlRBG59fT2Tmp4xG80QAMpg6YKGfW2edxUooy6VwxUuI0mBujiJu8RizJP-Y53g-TNbryMxl3xNsYoxpZj2jdHiwsgCGrPvQcYmO3_zmW9cjTFiJc2eZGGz", true) }
  let(:shipment) { Sendvia::Shipment.find 'fa13db9f-1ee7-4d08-9e85-0cee3147cebc' }

  subject { shipment.alerts }

  it 'should return a collection of alerts' do
    expect(subject.class).to eq(Array)
  end
end
