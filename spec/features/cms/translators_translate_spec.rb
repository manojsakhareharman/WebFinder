require "rails_helper"

feature "Translators do some translating" do

  before :all do
    @translator = FactoryGirl.create(:admin_user, translator: true)
    @locale = FactoryGirl.create(:available_locale)
    @translator.locales << @locale
  end

  before :each do
    visit cms_root_path
    signin(@translator.email, @translator.password)
  end

  scenario "navigates to translation page for assigned locale" do
    brand = FactoryGirl.create(:brand) # which means it needs translation
    visit cms_root_path

    click_on 'start translating'

    expect(current_path).to eq(cms_available_locale_path(@locale))
    expect(page).to have_link("Brands", href: cms_available_locale_brand_path(@locale, brand))
  end

  scenario "translates a record" do
    skip "do other one first"
    brand = FactoryGirl.create(:brand) # which means it needs translation

    visit cms_available_locale_path(@locale)
    click_on "Brands"
    click_on brand.name
    fill_in :description, with: "translated description for locale"
    click_on "Save"

    brand.reload
    I18n.locale = @locale.key
    expect(brand.description).to eq("translated description for locale")

    I18n.locale = default_locale
    expect(brand.description).not_to eq("translated description for locale")

    expect(current_path).to eq(cms_available_locale_brand_path(@locale, brand))
  end
end
