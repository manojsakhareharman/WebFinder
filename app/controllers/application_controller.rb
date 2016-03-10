class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_locale
    if params[:locale].present?
      session[:locale] = params[:locale]
    end
    if session[:locale].present?
      I18n.locale = session[:locale]
    else
      I18n.locale = http_accept_language.compatible_language_from(AvailableLocale.live) ||
        I18n.default_locale
    end
  end

  def all_brands
    Brand.all_for_site
  end
  helper_method :all_brands

  def track_last_page
    session["last_page"] = request.path
  end

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

  def pundit_user
    current_admin_user
  end

end
