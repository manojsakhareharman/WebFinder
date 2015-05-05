require 'rails_helper'

RSpec.describe ConsultantsController, type: :controller do

  before :all do
    @brand = FactoryGirl.create(:brand, downloads_page_url: "http://brand.download.page")
    @other_brand = FactoryGirl.create(:brand, downloads_page_url: '')
  end

  describe "GET :index" do
    before do
      get :index
    end

    it "assigns @brands" do
      expect(assigns(:brands)).to include(@brand)
      expect(assigns(:brands)).not_to include(@other_brand)
    end

    it "renders index template" do
      expect(response).to render_template('index')
    end
  end

end
