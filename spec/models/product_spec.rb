require 'rails_helper'

RSpec.describe Product, :type => :model do
  before do
    @product = FactoryGirl.create(:product)
  end

  subject { @product }
  it { should respond_to(:name) }
  it { should respond_to(:brand) }
  it { should respond_to(:photo) }
  it { should respond_to(:url) }
  it { should respond_to(:description) }
  it { should respond_to(:ecommerce_id) }

  describe "ecommerce" do
    it "should generate a 'buy now' URL" do
      @product.update_column(:ecommerce_id, "abc123")

      expect(@product.buy_now_url).to match(/http/i)
      expect(@product.buy_now_url).to match(/#{@product.ecommerce_id}/)
    end

    it "#ecommerce_enabled should return 'false' when no ecommerce_id is provided" do
      @product.update_column(:ecommerce_id, '')

      expect(@product.ecommerce_enabled).to be(false)
      expect(@product.buy_now_url).to eq('')
    end

    it "#ecommerce_enabled should return 'true' when ecommerce_id is provided" do
      @product.update_column(:ecommerce_id, "xyz999")

      expect(@product.ecommerce_enabled).to be(true)
    end
  end

  it "with a photo attached #tiny_photo_url generates a URL" do
    @product.photo = File.open(Rails.root.join("app", "assets", "images", "missing", "banners", "large.jpg"))
    @product.save

    expect(@product.tiny_photo_url).to be_a(String)
  end

  it "without a photo attached #tiny_photo_url generates a URL" do
    expect(@product.tiny_photo_url).to be_a(String)
  end

end
