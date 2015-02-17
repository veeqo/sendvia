require 'spec_helper'

describe Sendvia::Parcel::Milestone, "#all", vcr: 'parcels/milestones/all' do

  let!(:session) { Sendvia::Session.new("M2Gmsv0u4-OoUTtqiLioj8bgJM1_hfmESlDOr_YrX_Lwl_m8gL_61AKjmUBrcY4nOgHfik2u162Saj5bCcFFF7TInaNmpZsoNkBujj7Ush6drJgU6aBMcyQvlI39JWOObu9QOR2PlluR-oDcEhhKYL8soP8AkN6DYNlnUYDjZ7P8p_ZKk6R6m1YaBlOdytxyGxKePCR4Pg2NmpvTJacHy814k-F3OnYJQNfqYUtZ66ZW05VFuBTnwTHgCRTnKr6_", true) }

  subject { Sendvia::Parcel::Milestone.all(params: { parcel_id: 'b1dca525-da08-452a-89ff-36a658c87fef' }) }

  it "should create a milestone for the parcel" do
    expect(subject.class).to eq(ActiveResource::Collection)
  end
end
