class LandingPagesController < ApplicationController

  def show
    @landing_page = LandingPage.find(params[:id])
  end

  def contacts
  end

  def training
  end

  def privacy_policy
    if LandingPage.exists?(slug: "privacy-policy")
      @landing_page = LandingPage.find("privacy-policy")
      render action: :show and return false
    else
      redirect_to "http://www.harman.com" and return false
    end
  end

  def terms_of_use
    if LandingPage.exists?(slug: "terms-of-use")
      @landing_page = LandingPage.find("terms-of-use")
      render action: :show and return false
    else
      redirect_to "http://www.harman.com" and return false
    end
  end

  def thankyou
  end

  def thanks
  end

end
