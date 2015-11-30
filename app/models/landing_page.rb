class LandingPage < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  translates :title, :subtitle, :main_content, :left_content, :right_content, :sub_content, :description

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
