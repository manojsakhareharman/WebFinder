class Cms::LandingPagesController < CmsController
  before_action :set_locale_for_translator

  def index
    @landing_pages = LandingPage.all
    if @available_locale
      render template: 'cms/available_locales/landing_pages/index' and return false
    end
  end

  def show
    @landing_page = LandingPage.find(params[:id])
    if @available_locale
      render template: 'cms/available_locales/landing_pages/edit' and return false
    end
  end

  def edit
    @landing_page = LandingPage.find(params[:id])
    if @available_locale
      render template: 'cms/available_locales/landing_pages/edit' and return false
    end
  end

  def update
    @landing_page = LandingPage.find(params[:id])
    if @landing_page.update_attributes(landing_page_params)
      if @available_locale
        redirect_to [:cms, @available_locale, @landing_page.class], notice: 'Update successful'
      end
    else
      if @available_locale
        render template: 'cms/available_locales/landing_pages/edit'
      end
    end
  end

  private

  def landing_page_params
    params.require(:landing_page).permit(
      :title, :subtitle, :main_content, :left_content, :right_content, :sub_content, :description
    )
  end
end
