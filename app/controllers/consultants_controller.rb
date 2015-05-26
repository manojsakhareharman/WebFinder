class ConsultantsController < ApplicationController

  def index
    @brands = Brand.for_consultant_portal
    @brands_with_contact_info = @brands.where("contact_info_for_consultants IS NOT NULL and contact_info_for_consultants != ''")
  end

end
