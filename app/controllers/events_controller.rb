class EventsController < ApplicationController

  def index
    @events = Event.current_and_upcoming.where("start_on < ?", 6.months.from_now)
  end

  def show
    @event = Event.find(params[:id])
    unless @event.active?
      redirect_to events_path and return false
    end
  end

  def recent
    @events = Event.recent
  end

end
