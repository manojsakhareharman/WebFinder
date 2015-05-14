# Preview all emails at http://localhost:3000/rails/mailers/service_center_mailer
class ServiceCenterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/service_center_mailer/registration
  def registration
    ServiceCenterMailer.registration
  end

end
