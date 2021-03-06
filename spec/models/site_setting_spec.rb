require 'rails_helper'

RSpec.describe SiteSetting, :type => :model do

  describe "default values" do
    it "should return a value, even if it does not exist" do
      expect(SiteSetting.value("goober")).to eq("Missing Site Setting: goober")
    end

    it "should return a value if it exists without an empty value" do
      setting = FactoryGirl.create(:site_setting, content: "")

      expect(SiteSetting.value(setting.name)).to eq("Empty Site Setting: #{setting.name}")
    end
  end

  describe "standard value" do
    it ".value should return the value" do
      setting = FactoryGirl.create(:site_setting, content: "Something Good.")

      expect(SiteSetting.value(setting.name)).to eq(setting.content)
    end
  end

  describe "caching values" do
    it "should not reload from the database after loading once" do
      setting = FactoryGirl.create(:site_setting, content: "Original Value")

      original = SiteSetting.value(setting.name)
      setting.update_column(:name, "New Name")
      setting.reload

      expect(SiteSetting.value(setting.name)).to eq(original)
    end

    it "should reload after updating the setting" do
      setting = FactoryGirl.create(:site_setting, content: "Original Value")

      SiteSetting.value(setting.name)
      setting.update_attributes(content: "New Value")
      setting.reload

      expect(SiteSetting.value(setting.name)).to eq(setting.content)
    end

    it "should reload a previously missing setting after its creation" do
      SiteSetting.value("foo-bar")

      setting = FactoryGirl.create(:site_setting, name: "foo-bar")

      expect(SiteSetting.value(setting.name)).to eq(setting.content)
    end

  end

end
