class Example < ActiveRecord::Base
  belongs_to :vertical_market

  validates :name, presence: true
  validates :vertical_market, presence: true

  acts_as_list scope: :vertical_market

  def previous
    higher_item unless first?
  end

  def next
    lower_item unless last?
  end
end
