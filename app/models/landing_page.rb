class LandingPage < ActiveRecord::Base
  translates :slug, :title, :subtitle, :main_content, :left_content, :right_content, :sub_content, :description
  extend FriendlyId
  friendly_id :title, use: :globalize

  validates :title, presence: true
  validates :main_content, presence: true

  def side_column_width
    3
  end

  def main_content_width
    mcw = 12
    mcw -= side_column_width if self.left_content.present?
    mcw -= side_column_width if self.right_content.present?
    mcw
  end
end
