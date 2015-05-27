class ServiceCenter < ActiveRecord::Base
  has_many :service_center_service_groups
  has_many :service_groups, through: :service_center_service_groups

  validates :willingness, acceptance: true, on: :create
  validates :name, presence: true, uniqueness: true
  validates :contact_name, presence: true
  validates :email, presence: true
  validates :zip, presence: true

  def self.active
    where(active: true).includes(:service_center_service_groups)
  end

  def self.states
    pluck(:state).uniq.sort
  end

end
