require 'rails_helper'

RSpec.describe CaseStudy, :type => :model do
  before :all do
    @case_study = FactoryGirl.create(:case_study)
  end

  subject { @case_study }
  it { should respond_to(:vertical_market) }
  it { should respond_to(:friendly_id) }

  describe "friendly id" do
    it "generates a new slug when name changes" do
      old_slug = @case_study.slug

      @case_study.name = "Yo Mama #{@case_study.name}"
      @case_study.save
      @case_study.reload

      expect(@case_study.slug).not_to eq old_slug
    end

    it "generates a new slug when name changes" do
      old_slug = @case_study.slug

      @case_study.name = "Yo Mama #{@case_study.name}"
      @case_study.save
      @case_study.reload

      expect(@case_study.slug).not_to eq old_slug
      expect(@case_study.slug.present?).to be(true)
    end
  end
end

