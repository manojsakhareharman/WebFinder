require "rails_helper"

RSpec.describe BrandsController do

  before :all do
    @brand = FactoryGirl.create(:brand)
  end

  describe "GET :show" do

    before do
      get :show, id: @brand.id
    end

    it "assigns @brand" do
      expect(assigns(:brand)).to eq(@brand)
    end

    it "renders the brand page" do
      expect(response).to render_template('brands/show')
    end
  end
end
