class LeadMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.new_lead.subject
  #
  def new_lead(lead, locale=I18n.default_locale)
    @lead = lead

    Globalize.with_locale(locale) do
      tos = SiteSetting.value('leadgen-recipients').split(',')
      from = SiteSetting.value('leadgen-sender') || "leadgen@harman.com"
      mail to: tos, from: from
    end
  end
end
