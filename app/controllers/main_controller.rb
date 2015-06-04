class MainController < ApplicationController

  def index
    @vertical_markets = VerticalMarket.parent_verticals
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
        @pages << { url: training_url, updated_at: 1.week.ago, changefreq: 'weekly', priority: 0.3 }
        @pages << { url: contacts_url, updated_at: 1.week.ago, changefreq: 'weekly', priority: 0.3 }
        @pages << { url: consultants_url, updated_at: 1.week.ago, changefreq: 'weekly', priority: 0.4 }
        @pages << { url: service_url, updated_at: 1.week.ago, changefreq: 'weekly', priority: 0.2 }
        @pages << { url: service_centers_url, updated_at: 1.week.ago, changefreq: 'weekly', priority: 0.3 }
        @pages << { url: new_service_center_url, updated_at: 1.week.ago, changefreq: 'weekly', priority: 0.3 }
        @pages << { url: service_center_login_url, updated_at: 1.week.ago, changefreq: 'weekly', priority: 0.2 }
      }
    end
  end
end
