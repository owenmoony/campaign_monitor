require 'email_campaign_sampler'
class EmailCampaignsController < ApplicationController

  def index
    EmailCampaignSampler.run
    @email_campaigns = EmailCampaign.joins(:samples).where("samples.latest = 1 and samples.finished <> 0").order("email_campaigns.issued_at, samples.created_at")
  end

end
