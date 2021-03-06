require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      artist = FactoryGirl.create(:artist)
      get :show, id: artist.to_param
      expect(response).to have_http_status(:success)
    end
  end

end
