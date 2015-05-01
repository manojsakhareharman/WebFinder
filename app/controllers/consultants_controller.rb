class ConsultantsController < ApplicationController

  def index
    @brands = Brand.for_consultant_portal
  end

end
