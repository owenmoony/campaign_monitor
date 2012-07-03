require 'yaml'
require 'open-uri'
class EmailCampaignSampler

  WHITE_LIST = %w{bro-test}
  DOMAIN_BASE = "app.office.boxdice.com.au"

  def self.run
    return self.new.run
  end

  def run
    dir = Dir.glob('/opt/deploy/config/cluster_*')
    dir.each do |file|
      config = YAML::load(File.open(file))
      config["clusters"].each do |cluster|
        cluster["domains"].each do |domain|
          check(domain) if WHITE_LIST.include?(domain)
        end
      end
    end
  end

  def check(domain_name)
    begin
      domain = Domain.find_or_create_by_name(domain_name)
      url = "http://#{domain_name}.#{DOMAIN_BASE}/email_campaigns/progress.json"
      samples = JSON.parse(open(url).read)
      samples.each do |sample|
        campaign = EmailCampaign.find_or_create_by_remote_id_and_domain_id_and_subject(
            sample["id"].to_i,
            domain.id,
            sample["subject"],
        )
        campaign.emails_count = sample["emails_count"]
        campaign.issued_at = sample["issued_at"]
        campaign.remote_id = sample["id"]
        campaign.save!
        Sample.where(email_campaign_id: campaign.id).update_all(:latest => false)
        sample = Sample.create(
            email_campaign_id: campaign.id,
            draft: sample["draft"],
            finished: sample["finished"],
            dispatched: sample["dispatched"],
            delivered: sample["delivered"],
            deferred: sample["deferred"],
            bounce: sample["bounce"],
            failed: sample["failed"],
            dropped: sample["dropped"],
            latest: true,
        )
        campaign.send_alerts
        Rails.logger.info "created sample for #{sample}"
      end
    rescue Exception => e
      Rails.logger.error "Error processing domain #{domain_name}"
      Rails.logger.error "Error: #{e.message}"
    end
  end

end