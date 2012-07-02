require 'email_campaign_sampler'

namespace :samples do
  desc "Run a sample to collect the current campaigns in progress"
  task :run => :environment do
    EmailCampaignSampler.run
  end
end
