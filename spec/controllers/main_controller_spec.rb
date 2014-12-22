require 'rails_helper'

RSpec.describe MainController do

  describe "GET index" do

    before do
      @vertical_market = FactoryGirl.create(:vertical_market, parent_id: nil)
      get :index
    end

    it "assigns @vertical_markets" do
      expect(assigns(:vertical_markets)).to include(@vertical_market)
    end

    it "renders index template" do
      expect(response).to render_template("index")
    end

  end

  describe "GET thankyou" do
    it "renders thankyou template" do
      get :thankyou
      expect(response).to render_template("thankyou")
    end
  end

end
