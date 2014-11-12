require 'rails_helper'

RSpec.describe ExamplesController, :type => :controller do

  describe "GET show" do
    before do
      @example = FactoryGirl.create(:example)
      get :show, id: @example.id, vertical_market_id: @example.vertical_market_id
    end

    it "assigns @example" do
      expect(assigns(:example)).to eq(@example)
    end

    it "assigns @vertical_market" do
      expect(assigns(:vertical_market)).to eq(@example.vertical_market)
    end

    it "renders show template" do
      expect(response).to render_template("show")
      expect(response).to have_http_status(:success)
    end
  end

end
