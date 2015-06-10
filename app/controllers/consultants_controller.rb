class ConsultantsController < ApplicationController

  def index
    @brands = Brand.for_consultant_portal
    all_brands_with_contact_info = @brands.where("contact_info_for_consultants IS NOT NULL and contact_info_for_consultants != ''")
    first_brands_with_contact_info = all_brands_with_contact_info.where("name LIKE 'Harman%%'")
    @brands_with_contact_info = first_brands_with_contact_info + (all_brands_with_contact_info - first_brands_with_contact_info)
  end

end
