class ServiceCentersController < ApplicationController

  # GET /service_centers
  # GET /service_centers.json
  # This is the service center search page
  def index
    @service_centers = ServiceCenter.all
  end

  # GET /service_centers/login
  # (Not really a login page, but links to brands' tech login pages.)
  def login
    @brands = Brand.for_service_site
  end

  # GET /service_centers/new
  def new
    @service_center = ServiceCenter.new
  end

  # POST /service_centers
  # POST /service_centers.json
  def create
    @service_center = ServiceCenter.new(service_center_params)
    @service_center.active = false

    respond_to do |format|
      if @service_center.save
        ServiceCenterMailer.registration(@service_center).deliver_later
        format.html { redirect_to service_center_login_path, notice: 'Thank you for your interest in becoming a HARMAN authorized service center. We will get back with you shortly.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_center_params
      params.require(:service_center).permit(:name, :contact_name, :address, :city, :state, :zip, :phone, :fax, :email, :website, :account_number, :willingness)
    end
end
