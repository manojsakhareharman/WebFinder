require "rails_helper"

RSpec.describe CmsController do

  describe "GET :index (logged in)" do
    it "responds with dashboard" do
      @admin_user = FactoryGirl.create(:admin_user, translator: true)
      sign_in(@admin_user, scope: :admin_user)

      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "GET :index (not logged in)" do
    it "redirects to login" do
      get :index

      expect(response).to redirect_to(new_admin_user_session_path)
    end
  end
end
