class LeadsController < ApplicationController
  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
  end

  private

  def lead_params
    params.require(:lead).permit(:name, :company, :email, :phone, :project_description)
  end
end
