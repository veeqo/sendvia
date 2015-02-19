require 'spec_helper'

describe Sendvia::Markup, "#create", vcr: 'markup/create' do

  let!(:session) { Sendvia::Session.new("78XQ1n5fMB9g9fYIk2gQl7qxvJrm1HcpBM0bY3oLGEb93BUS8AsKeUSs2ZVjh92iA4h4C45kLrqX7Nav5Ao1jiXaB-X1IDUN29tHMERSfR1S4DpHmossCc5MX03EM1dloM2Voz_6JVCCZj0kedywYkPaRWYb89O5vCsoTf7f69ZXhtPJ2UBz-6wGfKsJMM0YopfrQ1jRAnPOjXVZi1GNOs_hkTrRA3QvSgpTXiYa0UYPJ9KpPjvvjUSOh53DWXCi", true) }

  subject do
    Sendvia::Markup.create(Id: SecureRandom.uuid,
      Carrier: 'deb6893f-c2a5-4be0-a20a-4c0c28d2065f',
      Service: 'f679eada-b61f-4292-b17b-4d14853715c5',
      Route: '7a300f97-f160-4843-b0eb-81a5f7fbd6c0',
      Amount: 1.0,
      Currency: 826)
  end

  it "should create the markup" do
    pending 'Not supported by API as of yet'
    expect { subject }.not_to raise_error
  end
end
