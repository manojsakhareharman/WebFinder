require 'rails_helper'

RSpec.describe CaseStudiesController, :type => :controller do

  describe "GET show" do
    before do
      @vertical_market = FactoryGirl.create(:vertical_market)
      @case_study = FactoryGirl.create(:case_study, vertical_market: @vertical_market)
      get :show, vertical_market_id: @vertical_market.id, id: @case_study.id
    end

    it "assigns @vertical_market" do
      expect(assigns(:vertical_market)).to eq(@vertical_market)
    end

    it "assigns @case_study" do
      expect(assigns(:case_study)).to eq(@case_study)
    end

    it "renders show template" do
      expect(response).to render_template("show")
      expect(response).to have_http_status(:success)
    end
  end

end
