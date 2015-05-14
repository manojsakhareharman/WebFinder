require "rails_helper"

RSpec.describe BrandsController do

  before :all do
    @brand = FactoryGirl.create(:brand)
  end

  describe "GET :show" do

    it "assigns @brand" do
      get :show, id: @brand.id

      expect(assigns(:brand)).to eq(@brand)
    end

    it "renders the brand page" do
      get :show, id: @brand.id

      expect(response).to render_template('brands/show')
    end

    it "redirects to root for service-only brand" do
      service_brand = FactoryGirl.create(:brand, show_on_main_site: false)

      get :show, id: service_brand.id

      expect(response).to redirect_to(root_path)
    end

  end

end
