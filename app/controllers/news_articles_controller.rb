class NewsArticlesController < ApplicationController
  respond_to :html, :json

  def index
    news_articles = NewsArticle.where("post_on <= ?", Date.today)
    @news_articles = filter_by_locale(news_articles).limit(999).order("post_on DESC")
  end

  def show
    @news_article = NewsArticle.find(params[:id])
  end

  private

  # Removes articles which don't belong to the current locale.
  # We fall back to articles with no locale, or default locale.
  #
  def filter_by_locale(news_articles)
    included_locales = []
    if AvailableLocale.exists?(key: I18n.locale)
      included_locales << AvailableLocale.find_by(key: I18n.locale).id
    end
    if included_locales.length == 0
      included_locales = [nil, '', AvailableLocale.default_id]
    end
    news_articles.where(locale_id: included_locales)
  end
end
