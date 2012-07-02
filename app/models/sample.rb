class Sample < ActiveRecord::Base
  belongs_to :email_campaign

  def sent
    (self.dispatched || 0) +
      (self.delivered || 0) +
      (self.dropped || 0) +
      (self.deferred || 0) +
      (self.failed || 0) +
      (self.bounce || 0)
  end

end
