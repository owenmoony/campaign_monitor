require 'net/smtp'

class EmailCampaign < ActiveRecord::Base
  belongs_to :domain
  has_many :samples

  def latest_sample
    Sample.where(email_campaign_id: self.id).where(latest: true).order(:created_at).last
  end

  def update_stats
    EmailCampaignSampler.new.check(self.domain.name)
  end

  def send_alerts
    latest = latest_sample
    samples.each do |sample|
      next if sample.id == latest.id || (sample.finished == 0 && sample.draft == 0)
      if sample.finished == latest.finished && sample.draft == latest.draft && (latest.created_at - sample.created_at) > 1.hour
        Net::SMTP.start('localhost', 25) do |smtp|
          msg = "Subject: Email Campaign alert --> (#{self.domain.name} count:#{self.emails_count} id:#{self.id})"
          Rails.logger.info msg
          smtp.send_message msg, 'owenm@boxdice.com.au', 'owenm@boxdice.com.au'
        end
      end
    end

  end

end
