class ConsultantsController < ApplicationController
  respond_to :html, :json

  def index
    @brands = Brand.for_consultant_portal
    all_brands_with_contact_info = @brands.where("contact_info_for_consultants IS NOT NULL and contact_info_for_consultants != ''")
    first_brands_with_contact_info = all_brands_with_contact_info.where("name LIKE 'Harman%%'")
    @brands_with_contact_info = first_brands_with_contact_info + (all_brands_with_contact_info - first_brands_with_contact_info)
  end

  # All software from all brands
  def software
    collected_software = {}
    Brand.where(show_on_consultant_page: true).where("api_url LIKE ?", '%%http%%').each do |brand|
      brand_software = BrandApi.software brand.softwares_api
      brand_software.each do |s|
        collected_software[s['formatted_name']] = s
      end
    end

    @software = collected_software.values.sort_by{|s| s['formatted_name']}
    respond_with @software, root: 'softwares'
  end

end
