require 'rails_helper'

RSpec.describe LandingPagesController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      landing_page = FactoryGirl.create(:landing_page)

      get :show, id: landing_page.to_param

      expect(assigns(:landing_page)).to eq landing_page
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:success)
    end
  end

end
