class ServiceCenterMailer < ApplicationMailer

  def registration(service_center)
    @service_center = service_center

    mail to: ENV['service_center_registration_recipient'],
      subject: "Service Center Registration",
      from: @service_center.email
  end
end
