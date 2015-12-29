class Cms::VenuesController < CmsController
  before_action :set_locale_for_translator

  def index
    @venues = Venue.all
    if @available_locale
      render template: 'cms/available_locales/venues/index' and return false
    end
  end

  def show
    @venue = Venue.find(params[:id])
    if @available_locale
      render template: 'cms/available_locales/venues/edit' and return false
    end
  end

  def edit
    @venue = Venue.find(params[:id])
    if @available_locale
      render template: 'cms/available_locales/venues/edit' and return false
    end
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(venue_params)
      if @available_locale
        redirect_to [:cms, @available_locale, @venue.class], notice: 'Update successful'
      end
    else
      if @available_locale
        render template: 'cms/available_locales/venues/edit'
      end
    end
  end

  private

  def venue_params
    params.require(:venue).permit(
      :name, :description
    )
  end
end
