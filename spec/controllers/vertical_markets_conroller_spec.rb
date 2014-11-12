require 'rails_helper'

RSpec.describe VerticalMarketsController do

  describe "GET show" do
    before do
      @vertical_market = FactoryGirl.create(:vertical_market)
      get :show, id: @vertical_market.id
    end

    it "assigns @vertical_market" do
      expect(assigns(:vertical_market)).to eq(@vertical_market)
    end

    it "renders show template" do
      expect(response).to render_template("show")
      expect(response).to have_http_status(:success)
    end
  end
end
