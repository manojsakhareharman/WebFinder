class EventsController < ApplicationController

  def index
    @events = Event.current_and_upcoming
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
