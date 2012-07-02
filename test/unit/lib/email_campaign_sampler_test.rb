require 'test_helper'
require 'email_campaign_sampler'

class EmailCampaignSamplerTest < ActiveSupport::TestCase

  test "the truth" do

     assert_not_nil EmailCampaignSampler.run
  end

end
