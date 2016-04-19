class MenuItem < ActiveRecord::Base
  belongs_to :locale, class_name: "AvailableLocale"

  validates :title, presence: true
  validates :link, presence: true
end
