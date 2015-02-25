require 'spec_helper'

describe Sendvia::Markup, "#all", vcr: 'markup/all' do

  let!(:session) { Sendvia::Session.new("78XQ1n5fMB9g9fYIk2gQl7qxvJrm1HcpBM0bY3oLGEb93BUS8AsKeUSs2ZVjh92iA4h4C45kLrqX7Nav5Ao1jiXaB-X1IDUN29tHMERSfR1S4DpHmossCc5MX03EM1dloM2Voz_6JVCCZj0kedywYkPaRWYb89O5vCsoTf7f69ZXhtPJ2UBz-6wGfKsJMM0YopfrQ1jRAnPOjXVZi1GNOs_hkTrRA3QvSgpTXiYa0UYPJ9KpPjvvjUSOh53DWXCi", true) }

  subject { Sendvia::Markup.all }

  it "should return a collection a markups" do
    expect(subject.class).to eq(Array)
  end
end
