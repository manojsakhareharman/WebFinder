class MainController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @vertical_markets = VerticalMarket.parent_verticals
  end

  def privacy_policy
  end

  def terms_of_use
  end

  def thankyou
  end

  def venues
    @venues = []
    respond_to do |format|
      format.json { respond_with @venues }
    end
  end

  def sitemap
    @vertical_markets = VerticalMarket.all
    respond_to do |format|
      format.html
      format.xml {
        @pages = []
        @pages << { url: root_url, updated_at: 1.day.ago, changefreq: 'daily', priority: 1 }
        all_brands.each do |brand|
          @pages << { url: brand_url(brand), updated_at: brand.updated_at, changefreq: 'monthly', priority: 0.4 }
        end
        @vertical_markets.each do |vertical_market|
          @pages << { url: vertical_market_url(vertical_market), updated_at: vertical_market.updated_at,
                      changefreq: 'weekly', priority: 0.9 }
          vertical_market.reference_systems.each do |reference_system|
            @pages << { url: vertical_market_reference_system_url(vertical_market, reference_system),
                        updated_at: reference_system.updated_at,
                        changefreq: 'weekly', priority: 0.8 }
          end
          vertical_market.case_studies.each do |case_study|
            @pages << { url: vertical_market_case_study_url(vertical_market, case_study),
                        updated_at: case_study.updated_at,
                        changefreq: 'monthly', priority: 0.7 }
          end
        end
      }
    end
  end
end
