class EmailCampaign < ActiveRecord::Base
  belongs_to :domain
  has_many :samples

  def recent_sample
    Sample.where(email_campaign_id: self.id).order(:created_at).last
  end

  def update_stats
    EmailCampaignSampler.new.check(self.domain.name)
  end

end
