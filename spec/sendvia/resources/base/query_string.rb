require 'spec_helper'

describe Sendvia::Base, "query_string" do
  let(:querystring_attributes) do
    {
      key: ['value1', 'value2']
    }
  end

  subject { Sendvia::Base.query_string(querystring_attributes) }

  it 'should return arrays using square bracketed variable names' do
    expect(subject).to eql("?key[]=value1&key[]=value2")
  end
end
