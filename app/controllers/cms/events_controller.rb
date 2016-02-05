class Cms::EventsController < CmsController
  before_action :set_locale_for_translator

  def index
    @events = Event.all
    if @available_locale
      render template: 'cms/available_locales/events/index' and return false
    end
  end

  def show
    @event = Event.find(params[:id])
    if @available_locale
      render template: 'cms/available_locales/events/edit' and return false
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @available_locale
      render template: 'cms/available_locales/events/edit' and return false
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      if @available_locale
        redirect_to [:cms, @available_locale, @event.class], notice: 'Update successful'
      end
    else
      if @available_locale
        render template: 'cms/available_locales/events/edit'
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :page_content
    )
  end
end
