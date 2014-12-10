require 'rails_helper'

describe "vertical_markets/show.html.erb" do
  context "parent vertical" do
    before do
      @vertical_market = FactoryGirl.create(:vertical_market, parent_id: nil)
      @child_verticals = FactoryGirl.create_list(:vertical_market, 3, parent_id: @vertical_market.id)
      @reference_system = FactoryGirl.create(:reference_system, vertical_market: @vertical_market)
      assign(:vertical_market, @vertical_market)
      assign(:reference_systems, [])

      render
    end

    it "links to child verticals" do
      @child_verticals.each do |vm|
        expect(rendered).to have_link(vm.name, href: vertical_market_path(vm))
      end
    end

    it "shows one banner" do
      expect(rendered).to have_xpath("//img[@src='/assets/#{@vertical_market.banner.url(:large)}']")
    end

    it "does not link to applications" do
      expect(rendered).not_to have_link(@reference_system.name)
    end
  end

  context "general" do
    before do
      @vertical_market = FactoryGirl.create(:vertical_market)
      @reference_system = FactoryGirl.build_stubbed(:reference_system, vertical_market: @vertical_market)
      assign(:vertical_market, @vertical_market)
      assign(:reference_systems, [@reference_system])

      render
    end

    it "has headline and description" do
      expect(rendered).to have_css("h2", text: @vertical_market.headline)
      expect(rendered).to have_css("div.description", text: @vertical_market.description)
    end
  end

  context "bottom-level vertical" do
    before do
      @vertical_market = FactoryGirl.create(:vertical_market)
    end

    describe "and reference systems" do
      before do
        @reference_systems = FactoryGirl.create_list(:reference_system, 9, vertical_market: @vertical_market)
        assign(:vertical_market, @vertical_market)
        assign(:reference_systems, @reference_systems)

        render
      end

      # with javascript, the application content loads inline via AJAX
      # without, it links to a reference_system view page
      it "shows related reference_system" do
        reference_system = @reference_systems.first

        expect(rendered).to have_css('h2', text: reference_system.headline)
      end

      it "shows the reference system pics, description" do
        reference_system = @reference_systems.first

        # Banner was moved to a content_for block, not in the show template itself
        #expect(view.content_for(:banner)).to have_xpath("//img[@src='/assets/#{reference_system.banner.url(:large)}']")
        expect(rendered).to have_xpath("//img[@src='/assets/#{reference_system.banner.url(:large)}']")
        expect(rendered).to have_content(reference_system.description)
      end

      it "shows only the first 6 reference systems" do
        reference_system = @reference_systems.last # (beyond the number we want to include)

        expect(rendered).not_to have_link(reference_system.headline, href: vertical_market_reference_system_path(@vertical_market, reference_system))
      end
    end

    describe "and case studies" do
      before do
        @case_studies = FactoryGirl.create_list(:case_study, 4, vertical_market: @vertical_market)
        @reference_system = FactoryGirl.build_stubbed(:reference_system, vertical_market: @vertical_market)
        assign(:vertical_market, @vertical_market)
        assign(:reference_systems, [@reference_system])

        render
      end

      it "links to case studies" do
        case_study = @vertical_market.featured_case_studies.first

        expect(rendered).to have_link(case_study.headline, href: vertical_market_case_study_path(@vertical_market, case_study))
      end
    end

  end

  context "child vertical" do
    before do
      @parent = FactoryGirl.create(:vertical_market)
      @vertical_market = FactoryGirl.create(:vertical_market, parent_id: @parent.id)
      @reference_system = FactoryGirl.build_stubbed(:reference_system, vertical_market: @vertical_market)
      assign(:vertical_market, @vertical_market)
      assign(:reference_systems, [@reference_system])

      render
    end

    it "shows content from the parent vertical market" do
      expect(rendered).to have_css("h3", text: @parent.headline)
      expect(rendered).to have_css("div.parent", text: @parent.description)
    end
  end

  context "retail" do
    before do
      @vertical_market = FactoryGirl.create(:vertical_market)
      @reference_system = FactoryGirl.create(:reference_system, vertical_market: @vertical_market)
      @product_type = FactoryGirl.create(:product_type)
      @product = FactoryGirl.create(:product)
      rspt = FactoryGirl.create(
        :reference_system_product_type,
        reference_system: @reference_system,
        product_type: @product_type
      )
      FactoryGirl.create(
        :reference_system_product_type_product,
        reference_system_product_type: rspt,
        product: @product
      )
      assign(:vertical_market, @vertical_market)
      assign(:reference_systems, [@reference_system])

      render
    end

    it "shows the product types involved" do
      expect(rendered).to have_content(@product_type.name)
    end

    it "has links to the product" do
      expect(rendered).to have_link(@product.name)
    end
  end
end
