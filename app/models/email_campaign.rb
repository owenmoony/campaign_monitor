class EmailCampaign < ActiveRecord::Base
  belongs_to :domain
  has_many :samples
end
