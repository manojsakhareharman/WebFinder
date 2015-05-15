 require "rails_helper"

RSpec.describe ServiceCentersController, as: :controller do
  before :all do
    @brand = FactoryGirl.create(:brand)
    @non_service_brand = FactoryGirl.create(:brand, show_on_services_site: false)
  end

  describe "GET :login" do
    before do
      get :login
    end

    it "assigns @brands" do
      expect(assigns(:brands)).to include(@brand)
      expect(assigns(:brands)).not_to include(@non_service_brand)
    end

    it "renders the login template" do
      expect(response).to render_template("login")
    end
  end

  describe "GET :new" do
    before do
      get :new
    end

    it "renderes the form successfully" do
      expect(assigns(:service_center)).to be_a_new(ServiceCenter)
      expect(response).to render_template("new")
      expect(response).to be_success
    end
  end

  describe "POST :create successfully" do
    before do
      @count = ServiceCenter.count
      @service_center = FactoryGirl.build :service_center

      post :create, service_center: @service_center.attributes
    end

    it "creates the new, inactive service center" do
      expect(ServiceCenter.count).to eq(@count + 1)
      expect(ServiceCenter.last.active?).to be(false)
    end

    it "redirects to the service centers login page" do
      expect(response).to redirect_to(service_center_login_path)
    end
  end

  def last_email
    ActionMailer::Base.deliveries.last
  end
end