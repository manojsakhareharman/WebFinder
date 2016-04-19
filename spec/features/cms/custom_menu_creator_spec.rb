require "rails_helper"

feature "Translators and admins can customize menus for their locale" do

  before :all do
    @translator = FactoryGirl.create(:admin_user, translator: true)
    @locale = FactoryGirl.create(:available_locale, key: 'es')
    @translator.locales << @locale
    I18n.locale = @locale.key
  end

  after :all do
    DatabaseCleaner.clean_with :truncation
    I18n.locale = I18n.default_locale
  end

  before :each do
    visit cms_root_path
    signin(@translator.email, @translator.password)
    within "##{@locale.key}_tools" do
      click_on "Customize Navigation"
    end
  end

  scenario "adds menu item successfully" do
    click_on "Add menu item"

    fill_in "menu_item_title", with: "Cosa Maravillosa"
    fill_in "menu_item_link", with: "http://cosamaravillosa.com"
    click_on "Save"

    visit root_path(locale: @locale.key)
    expect(page).to have_link "Cosa Maravillosa", href: "http://cosamaravillosa.com"
  end

end
