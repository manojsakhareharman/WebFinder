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

  describe "GET thankyou" do
    it "renders thankyou template" do
      get :thankyou

      expect(response).to render_template("thankyou")
    end
  end

  describe "GET thanks" do
    it "renders generic thanks template" do
      get :thanks

      expect(response).to render_template("thanks")
    end
  end

  describe "GET contacts" do
    it "responds with contacts page" do
      get :contacts

      expect(response).to be_success
      expect(response).to render_template("contacts")
    end
  end

  describe "GET training" do
    it "responds with training page" do
      get :training

      expect(response).to be_success
      expect(response).to render_template("training")
    end
  end

  describe "GET privacy_policy" do
    it "responds with privacy policy page" do
      get :privacy_policy

      expect(response).to be_success
      expect(response).to render_template("privacy_policy")
    end
  end

  describe "GET terms_of_use" do
    it "responds with terms page" do
      get :terms_of_use

      expect(response).to be_success
      expect(response).to render_template("terms_of_use")
    end
  end

end
