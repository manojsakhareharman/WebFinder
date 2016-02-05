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

  describe "GET sitemap.xml" do

    before do
      get :sitemap, format: :xml
    end

    it "assigns @pages" do
      expect(assigns(:pages)).to be_an(Array)
    end

    it "renders sitemap XML template" do
      expect(response).to render_template("sitemap")
    end
  end

  describe "GET sitemap (html)" do

    before do
      @vertical_market = FactoryGirl.create(:vertical_market)
      get :sitemap
    end

    it "assigns @vertical_markets" do
      expect(assigns(:vertical_markets)).to include(@vertical_market)
    end

    it "renders sitemap page" do
      expect(response).to render_template("sitemap")
    end
  end

  describe "GET sureroute-test-object (html)" do

    before do
      get :sureroute, format: :html
    end

    it "renders the template" do
      expect(response).to render_template("sureroute")
    end
  end

end
