require "rails_helper"

RSpec.describe ServiceController, as: :controller do

  describe "GET index" do

    it "renders the template" do
      get :index

      expect(response).to be_success
      expect(response).to render_template('index')
    end

  end
end
