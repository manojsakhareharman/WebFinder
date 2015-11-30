class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  # :nocov: (cancan not yet implemented)
  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end
  # :nocov:

  private

  def set_locale
    I18n.locale = params[:locale] ||
      http_accept_language.compatible_language_from(I18n.available_locales) ||
      I18n.default_locale
  end

  def all_brands
    Brand.all_for_site
  end
  helper_method :all_brands

  def track_last_page
    session["last_page"] = request.path
  end

end
