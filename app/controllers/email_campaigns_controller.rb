require 'email_campaign_sampler'
class EmailCampaignsController < ApplicationController

  def index
    #EmailCampaignSampler.run
    sql = "samples.latest = 1 and (samples.finished is not null or samples.draft is not null)"
    @email_campaigns = EmailCampaign.joins(:samples).where(sql).order("email_campaigns.issued_at, samples.created_at")
    @email_campaigns.each do |email_campaign|
      email_campaign.update_stats
    end
  end

end
