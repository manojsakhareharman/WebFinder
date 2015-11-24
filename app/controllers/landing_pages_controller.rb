class LandingPagesController < ApplicationController

  def show
    @landing_page = LandingPage.find(params[:id])
  end

  def contacts
  end

  def training
  end

  def privacy_policy
  end

  def terms_of_use
  end

  def thankyou
  end

  def thanks
  end

end
