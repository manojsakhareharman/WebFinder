require 'rails_helper'

RSpec.describe LeadsController, :type => :controller do

  describe "GET new" do
    before do
      get :new
    end

    it "assigns a new lead object" do
      expect(assigns(:lead)).to be_a_new(Lead)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    before do
      post :create, lead: FactoryGirl.build(:lead)
    end

  end

end
