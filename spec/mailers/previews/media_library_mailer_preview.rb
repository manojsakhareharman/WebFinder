# Preview all emails at http://localhost:3000/rails/mailers/media_library_mailer
class MediaLibraryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/media_library_mailer/access_request
  def access_request
    MediaLibraryMailer.access_request
  end

end
