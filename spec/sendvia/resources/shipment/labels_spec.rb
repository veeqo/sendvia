require 'spec_helper'

describe Sendvia::Shipment, '#labels', vcr: 'shipment/labels' do
  let!(:session) { Sendvia::Session.new("TEnn8RGUY0ySt-lulV-E_XVTnzUPuQ3oPM8Ow9o2YG4wZOaKzxgyNBUcUb0PcUT5A57SsxAdNVkpoQsswwjRW56_ee0eGezSvhCA38KPbhDm1ej5Tcu0LuEkrBnmvDfL9nnyM2ZwlbGFNC8b380_-BLNbrLcaQMaw7tTUo0tp2ZvXK_itcpp9Vw8lmuXa5IDUzpDu51fGihJc3um-ezb1H3SZ4KoXH9Ywij6NwKpr846j61srntvjk972dhYb32d", true) }

  subject { SendVia::Shipment.labels }

  it 'should return an array of pdfs' do
    pending 'There are no current available services that have a label to get, need to contact SendVia about this'
    raise #To allow spec to be pending
  end
end
