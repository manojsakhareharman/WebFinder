class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # :nocov: (cancan not yet implemented)
  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end
  # :nocov:

  private

  def all_brands
    Brand.all_for_site
  end
  helper_method :all_brands

  def track_last_page
    session["last_page"] = request.path
  end

end
