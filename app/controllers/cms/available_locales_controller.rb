class Cms::AvailableLocalesController < CmsController

  def show
    @available_locale = AvailableLocale.find(params[:id])
  end

end
