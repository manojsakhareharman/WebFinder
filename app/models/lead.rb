class Lead < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  after_create :notify_leadgen_recipients, :subscribe!

  def subscribe!
    @cheetahmail_client ||= CheetahMail::CheetahMail.new({
      :host      => 'ebm.cheetahmail.com',
      :username  => ENV['cheetahmail_username'],
      :password  => ENV['cheetahmail_password'],
      :aid       => ENV['cheetahmail_aid'],
      :messenger => CheetahMail::SynchronousMessenger
    })

    begin
      @cheetahmail_client.mailing_list_update(self.email, sub: ENV['cheetahmail_sub'])
    rescue CheetahMailException
      logger.debug("There was some cheetahmail exception")
    end
  end
  handle_asynchronously :subscribe!

  def notify_leadgen_recipients
    LeadMailer.new_lead(self).deliver_later
  end
end
