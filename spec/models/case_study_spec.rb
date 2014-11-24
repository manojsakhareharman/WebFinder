require 'rails_helper'

RSpec.describe CaseStudy, :type => :model do
  before do
    @case_study = FactoryGirl.create(:case_study)
  end

  subject { @case_study }
  it { should respond_to(:vertical_market) }

end

