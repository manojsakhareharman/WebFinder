class LeadMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.new_lead.subject
  #
  def new_lead(lead)
    @lead = lead

    tos = SiteSetting.value('leadgen-recipients').split(',')
    from = SiteSetting.value('leadgen-sender') || "leadgen@harman.com"
    mail to: tos, from: from
  end
end
