class SiteSetting < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  def self.value(setting_name)
    if s = find_by(name: setting_name)
      if s.content.present?
        s.content
      else
        "Empty Site Setting: #{setting_name}"
      end
    else
      "Missing Site Setting: #{setting_name}"
    end
  end

end
