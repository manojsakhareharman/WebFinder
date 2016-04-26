class SiteSetting < ActiveRecord::Base
  @@cache = {}
  validates :name, presence: true, uniqueness: true
  after_save :update_cached_value

  translates :content

  def self.value(setting_name)
    @@cache["#{setting_name}.#{I18n.locale}"] ||= get_value(setting_name)
  end

  def self.get_value(setting_name)
    s = find_by(name: setting_name)
    s ? s.value : missing_value(setting_name)
  end

  def self.set_value(setting_name, value)
    @@cache["#{setting_name}.#{I18n.locale}"] = value
  end

  def self.missing_value(setting_name)
    "Missing Site Setting: #{setting_name}"
  end

  def self.set?(setting_name)
    #exists?(name: setting_name)
    where(name: setting_name).where.not(content: [nil, ""]).exists?
  end

  # Strictly looks for setting for the locale. Otherwise, it would
  # traverse the defaults tree and always return true since English is
  # the final default for all locales.
  def self.set_for_locale?(setting_name, locale=I18n.locale)
    if exists?(name: setting_name)
      parent = find_by(name: setting_name)
      parent.translations.where(locale: locale).where.not(content: [nil, ""]).exists?
    end
  end

  def value
    self.content.present? ? self.content : empty_value
  end

  def empty_value
    "Empty Site Setting: #{self.name}"
  end

  def update_cached_value
    SiteSetting.set_value(name, value)
  end

end
