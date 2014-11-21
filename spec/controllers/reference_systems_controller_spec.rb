require 'rails_helper'

RSpec.describe ReferenceSystemsController, :type => :controller do

  describe "GET show" do
    before do
      @reference_system = FactoryGirl.create(:reference_system)
      get :show, id: @reference_system.id, vertical_market_id: @reference_system.vertical_market_id
    end

    it "assigns @reference_system" do
      expect(assigns(:reference_system)).to eq(@reference_system)
    end

    it "assigns @vertical_market" do
      expect(assigns(:vertical_market)).to eq(@reference_system.vertical_market)
    end

    it "renders show template" do
      expect(response).to render_template("show")
      expect(response).to have_http_status(:success)
    end
  end

end
