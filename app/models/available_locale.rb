# The I18n gem doesn't use this to determine which locales to load.
# This is just a way to correlate translators with their locales.
class AvailableLocale < ActiveRecord::Base
  extend FriendlyId
  friendly_id :key

  validates :key, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :locale_translators, dependent: :destroy
  has_many :translators, through: :locale_translators

  def self.default
    find_by(key: I18n.default_locale.to_s)
  end

  def self.translatables
    %w(Brand CaseStudy Event LandingPage ProductType Product ReferenceSystem SiteSetting Venue VerticalMarket)
  end

  def items_to_translate
    @items_to_translate ||= self.class.translatables.map do |t|
      t.constantize.needing_translations(self.key)
    end.flatten
  end
end
