class VenuesController < ApplicationController
  respond_to :json

  def index
    @venues = Venue.all
    respond_with @venues
  end

end
