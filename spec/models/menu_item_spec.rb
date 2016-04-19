require 'rails_helper'

RSpec.describe MenuItem, type: :model do

  before :all do
    @menu_item = FactoryGirl.build_stubbed(:menu_item)
  end

  subject { @menu_item }
  it { should respond_to :locale }

  it "locale is a locale" do
    expect(@menu_item.locale).to be_an AvailableLocale
  end
end
