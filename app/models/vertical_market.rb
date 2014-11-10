class VerticalMarket < ActiveRecord::Base
  acts_as_tree order: "name"
  validates :name, presence: true, uniqueness: true

  def self.parent_verticals
    where("parent_id IS NULL or parent_id <= 0")
  end
end
