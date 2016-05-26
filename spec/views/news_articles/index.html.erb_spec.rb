require 'rails_helper'

RSpec.describe "news_articles/index.html.erb", type: :view do
  before :all do
    @news_article = FactoryGirl.create(:news_article)

    assign(:news_articles,  [@news_article])
    assign(:featured_article, nil)
  end

  before :each do
    render
  end

  it "should show the news title" do
    expect(rendered).to have_link(@news_article.title)
  end
end
